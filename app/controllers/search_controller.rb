class SearchController < ApplicationController
  def index
    @repos = Search::Repos.call(params[:q], params[:page])
  end
end
