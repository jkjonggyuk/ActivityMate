# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def reset_password_email(user)
    @user = user
    @url  = 'http://example.com/reset_password'
    mail(to: @user.email, subject: 'Sorry to hear you are having trouble logging into Activitymate. To reset your password..')
  end
end
