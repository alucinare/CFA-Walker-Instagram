class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  #  protected
  #    def configure_permitted_parameters
  #       devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  #    end

  # def configure_permitted_parameters
  #   # Fields for sign up
  #   devise_parameter_sanitizer (:sign_up) { |u| u.permit(:username, :email, :password) }
  #   # Fields for editing an existing account
  #   devise_parameter_sanitizer (:account_update) { |u| u.permit(:username, :email, :password, :current_password, :gender) }
  # end


end
