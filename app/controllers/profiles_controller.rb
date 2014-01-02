class Profiles::RegistrationsController < Devise::RegistrationsController
  def index
  end

  def create
    super
    @user.build_profile
    @user.save!
  end
end