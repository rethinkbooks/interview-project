module Search
  # The repo search service. Searches GitHub for repos using Octokit.rb. Can be
  # used by calling a single class method or by creating a new instance and then
  # calling the <tt>call</tt> instance method.
  #
  # Instances of the repo search service can be initialized with their arguments
  # and all subsequent calls made with that instance will use the initializing
  # arguments unless otherwise specified.
  class Repos
    # Search GitHub for matching repos.
    #
    # ==== Parameters
    # * <tt>args</tt> - Arguments for the search. Only the <tt>:q</tt> option is
    #   required.
    #
    #   * <tt>:q</tt> - The actual search query.
    #   * <tt>:page</tt> - The page offset. Defaults to 0.
    #   * <tt>:per_page</tt> - The number of repos per page. Defaults to 100.
    #   * <tt>:order</tt> - <tt>'desc'</tt> to sort by stargazers descending or
    #     <tt>'asc'</tt> to sort by stargazers ascending. Otherwise sort by the
    #     default: relevance.
    #   * <tt>:language</tt> - The programming language to filter by.
    #
    #   All other qualifiers supported by the GitHub API are supported. For more
    #   info see: https://developer.github.com/v3/search/#search-repositories.
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

    def self.build_query(query, args)
      qualifiers = args.slice(:in, :size, :forks, :fork, :created, :pushed, :user, :repo, :language, :stars).map { |qualifier, value| "#{qualifier}:#{value}" }

      [query, qualifiers.join(' ')].reject(&:blank?).join(' ')
    end
    private_class_method :build_query

    def self.search_options(args)
      page = args.delete(:page).to_s.to_i

      per_page = args.delete(:per_page).to_s.to_i

      per_page = 100 if per_page < 1

      order = args.delete(:order)

      order = nil if order.blank?

      sort = 'stars' unless order.nil?

      { page: page, per_page: per_page, sort: sort, order: order }
    end
    private_class_method :search_options

    # Create a new repo search service object.
    #
    # ==== Parameters
    # * <tt>args</tt> - Arguments for any subsequent calls to to <tt>call</tt>.
    def initialize(args = {})
      @args = args
    end

    # Search GitHub for matching repos.
    #
    # ==== Parameters
    # * <tt>args</tt> - Arguments for the search. See the class <tt>call</tt>
    #   method for more information about what can be passed in.
    #
    #   NOTE: If arguments are passed the previous arguments, including those
    #   passed when creating the service object will be overwritten!
    def call(args = nil)
      @args ||= args

      self.class.call(@args)
    end
  end
end
