class UserMailer < ActionMailer::Base
  def welcome_email(user)
    recipients    user.email
    from          "Activity Mate Notifications <notifications@example.com>"
    subject       "Big Donkey's Activity Mate Password Reset!"
    sent_on       Time.now
    body          {:user => user, :url => "http://example.com/login"}
  end

end
