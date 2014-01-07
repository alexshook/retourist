class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def new
  	@user = User.create
  end

  def create
    @user = User.create params[:user]
  end

  def show
  	@user = User.find params[:id]
  end

  def edit
  	@user = User.find params[:id]
    redirect_to user 
  end

  def update
  	@user = User.find params[:id]
    user.update_attributes!(user_params)
    redirect_to user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end