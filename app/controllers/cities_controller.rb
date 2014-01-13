class CitiesController < ApplicationController
	before_action :authenticate_user!, except: :index

 	def index
  	@cities = City.all
  end

  def new
  	@city = City.create
  end

  def create
    city = City.create safe_city
  	redirect_to city
  end

  def update
  	@city = City.find params[:id]
  	city = City.update safe_city
		redirect_to city
 	end

  def show
    @city = City.find params[:id]
  end

  def edit
    @city = City.find params[:id]
    city = City.update safe_city
    redirect_to @city
  end

  private

  def safe_city
    params.require(:city).permit(:photo, :name, :country)
  end
end