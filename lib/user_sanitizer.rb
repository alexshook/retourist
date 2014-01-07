class User::ParameterSanitizer < Devise::ParameterSanitizer
	# required for adding custom attributes to devise user model
    private
    def account_update
        default_params.permit(:avatar, :first_name, :last_name, :age, :location, :job_title, :employer, :employer_description, :email, :password, :password_confirmation, :current_password)
    end
end