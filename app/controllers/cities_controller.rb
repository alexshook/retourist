class CitiesController < ApplicationController
	before_action :authenticate_user!, only: :create
 	def index
  		@cities = City.all
  	end
end
