module Search
  module Repos
    def self.call(args = {})
      query = args.delete(:q)

      return Kaminari.paginate_array([], total_count: 0) if query.blank?

      client = Octokit::Client.new

      options = search_options(args)

      results = client.search_repos(query, options)

      repos = results[:items].map { |result| Repo.new(result) }

      Kaminari.paginate_array(repos, total_count: results[:total_count]).page(options[:page]).per(options[:per_page])
    end

    private

    def self.search_options(args)
      page = args.delete(:page).to_s.to_i

      per_page = args.delete(:per_page).to_s.to_i

      per_page = 100 if per_page < 1

      order = args.delete(:order)

      order = nil if order.blank?

      sort = 'stars' unless order.nil?

      { page: page, per_page: per_page, sort: sort, order: order }
    end
  end
end
