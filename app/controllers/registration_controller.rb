class RegistrationController < Devise::RegistrationsController


	private

  def sign_up_params
    params.require(:user).permit(:name, :is_female, :date_of_birth, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :is_female, :date_of_birth, :email, :password, :password_confirmation, :current_password)
  end
end
