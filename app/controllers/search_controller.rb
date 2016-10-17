# Controller through which all GitHub searches are made.
class SearchController < ApplicationController
  # Calls the search service, passing along only the parameters relevant to the
  # to searching and the current user's OAuth token to ensure that the search
  # is authenticated.
  def index
    @repos = Search::Repos.call(params.slice(:q, :page, :order, :language).merge(access_token: session[:github_oauth_token]))
  end
end
