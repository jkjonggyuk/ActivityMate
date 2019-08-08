module SessionsHelper

	def log_in(user)
	   session[:userid] = user.id
	end

	def current_user
	@current_user ||= User.find_by(id: session[:user_id])
	end

end
