class LoginController < ApplicationController

  def new
  end

  def Login?
  	params[:submit] == 'Login'
  	render @user

  end

  def Signup?
  	params[:submit] == 'Sign Up'
  	redirect_to registration_path
  end
  
end
