class CitiesController < ApplicationController
	before_action :authenticate_user!, except: :index

 	def index
  	@cities = City.all
  end

  def new
  	@city = City.create
  end

  def create
		safe_city = params.require(:city).permit(:name, :rating)
    city = City.create safe_city
  	redirect_to city
  end

  def update
  	@city = City.find params[:id]
   	safe_city = params.require(:city).permit(:name, :rating)
  	city = City.create safe_city
		redirect_to city
 	end

  def show
    @city = City.find params[:id]
  end
end