class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  	@users = User.all
  end

  def new
  	@user = User.create
    binding:pry
  end

  def create
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

  def sent_messages
    @user = User.find params[:id]
  end

  def received_messages
    @user = User.find params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name)
  end
end
