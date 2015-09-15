module Search
  module Repos
    def self.call(query, page = nil, per_page = 100)
      return Kaminari.paginate_array([], total_count: 0) if query.blank?

      client = Octokit::Client.new

      results = client.search_repos(query, page: page, per_page: per_page)

      repos = results[:items].map { |result| Repo.new(result) }

      Kaminari.paginate_array(repos, total_count: results[:total_count]).page(page).per(per_page)
    end
  end
end
