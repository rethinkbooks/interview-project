class SearchController < ApplicationController
  def index
    @repos = Search::Repos.call(params.slice(:q, :page, :order))
  end
end
