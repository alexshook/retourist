class UsersController < ApplicationController
	load_and_authorize_resource skip_load_resource only: [:create] 
  def index
  end

  def current_user
  	@current_user = current_user.find params[:id]
  end
end
