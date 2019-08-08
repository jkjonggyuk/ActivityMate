class SessionsController < ApplicationController
  def new
  end

  def create
 	#user = User.find_by(email: params[:session][:email].downcase)
#     	if user && user.authenticate(params[:session][:password])
   #   	if user && user.authenticate(params[:session][:name])	
 	#	log_in user
	#	redirect_to user
   #   	else
		#render 'new'
 	end

  def destroy
  end

end
