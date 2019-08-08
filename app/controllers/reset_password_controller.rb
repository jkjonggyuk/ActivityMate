class ResetPasswordController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email =>params[:email])
	#user.generate_reset_password_token!
    redirect_to login_path
  end
end
