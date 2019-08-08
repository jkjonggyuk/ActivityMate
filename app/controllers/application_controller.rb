class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
  	#return an instance of user class that can be accessed throughout controllers
  	@user = User.find_by(:email => params[:email], :password => params[:password_hash])
  	@current_user = @user.id
  end
end
