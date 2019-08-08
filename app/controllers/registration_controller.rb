class RegistrationController < ApplicationController
  def new
  end

def create
  @user = User.new(params[:name, :email, :email_confirmation, :password])
 
  @user.save!
  redirect_to @user

  #if @user.save
   # flash[:notice] = "Registration successful!"
    #redirect_to controller: "users", action: "show"
  	#redirect_to searches_path, :notice => "Registration successful!"
  #else 
 # 	flash.now[:notice] = "Registration unsuccessful. Please enter information."
  #	render :new
  #end
end

end
