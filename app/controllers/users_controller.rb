class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def new
  end



def create
	  #byebug
	  @user = User.new(user_params)

	  @user.save!
	  redirect_to @user
    #redirect_to '/'
end



def new_login
	   # if @user && @user.password == BCrypt::Engine.hash_secret(params[:password], @user.password_hash)
	   # @user_temp = User.find_by(:email => params[:email])
	   	#blah
      #testing these 3 lines
      #blah
	   @user = User.find_by(:email => params[:email], :password => params[:password_hash])
     session[:passed_user_id] = @user.id
	   #else 
     	   #end
	   #else
		#redirect_to @user
		#render :new_login
	   #end
  end

#Authenticating a user
#def login
#	@user = User.find_by_email(params[:email])
#	if @user.password == params[:password]
#   	  give_token
#  	else
#    	  redirect_to @user
#  	end
#end


def create
	  #byebug
	  @user = User.new(user_params)

	  @user.save!
	  redirect_to @user
    #redirect_to '/'
end

  private
  def user_params
	  params.require(:user).permit(:name, :email, :email_confirmation, :password)
  end



end
