class SearchController < ApplicationController
  def index
  	query = params[:q]
  	@cities = City.search_for query
  end
end
