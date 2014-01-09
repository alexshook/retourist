class SearchController < ApplicationController
  def index
  	query = params[:q]
  	@cities = City.search_for query
  	if @cities.empty?
      flash[:notice] = "No matches."
    end
  end
end
