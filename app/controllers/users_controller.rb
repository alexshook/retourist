class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  	@users = User.all
  end

  def new
  	@user = User.create
  end

  def create
    # @user = User.create params[:user]
    user = User.create user_params
  end

  def update
    @user = User.find params[:id]
    user.update_attributes!(user_params)
    user = User.update user_params
  end

  def show
  	@user = User.find params[:id]
  end

  def edit
  	@user = User.find params[:id]
    user = User.update user_params
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end