class RegistrationsController < Devise::RegistrationsController

# SELF CREATE
private

  # These are the controllers methods that allow the user_name parameters to be passed through to the model, it inherits from the Devise class because that is the authentication system
  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password,
    :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password,
    :password_confirmation, :current_password)
  end

end
