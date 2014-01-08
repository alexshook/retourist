class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # redirect to last url after user registration
  # from devise github
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

	def store_location
	  # store last url - this is needed for post-login redirect to whatever the user last visited.
	  if (request.fullpath != "/users/login" &&
	      request.fullpath != "/users/signup" &&
	      request.fullpath != "/users/password" &&
	      !request.xhr?) # don't store ajax calls
	    session[:previous_url] = request.fullpath 
	  end
	end

	def after_sign_in_path_for(resource)
	  session[:previous_url] || root_path
	end

	protected

	# adds custom attributes to devise user model/edit registration page
	# without this they won't save to the database
	def configure_permitted_parameters
		# devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :age << :location << :job_title << :employer << :employer_description << :avatar_file_name << :avatar_content_type << :avatar_file_size << :avatar_updated_at 
		devise_parameter_sanitizer.for(:account_update).push :first_name, :last_name, :age, :location, :employer, :employer_description, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
	end	
    	# if resource_class == User
     #  		User::ParameterSanitizer.new(User, :user, params)
    	# else
     #  		super
    	# end
    
end