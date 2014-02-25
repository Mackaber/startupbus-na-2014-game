class Notifier < ActionMailer::Base
  default :from => 'buspreneur2014@startupbus.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Welcome To The Start Up Bus Game!')
  end
end
