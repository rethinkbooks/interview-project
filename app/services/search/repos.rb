module Search
  module Repos
    def self.call(args = {})
      query = args.delete(:q)

      return Kaminari.paginate_array([], total_count: 0) if query.blank?

      client = Octokit::Client.new(access_token: args.delete(:access_token))

      options = search_options(args)

      query = build_query(query, args)

      results = client.search_repos(query, options)

      repos = results[:items].map { |result| Repo.new(result) }

      Kaminari.paginate_array(repos, total_count: results[:total_count]).page(options[:page]).per(options[:per_page])
    end

    private

    def self.build_query(query, args)
      qualifiers = args.slice(:in, :size, :forks, :fork, :created, :pushed, :user, :repo, :language, :stars).map { |qualifier, value| "#{qualifier}:#{value}" }

      [query, qualifiers.join(' ')].reject(&:blank?).join(' ')
    end

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
