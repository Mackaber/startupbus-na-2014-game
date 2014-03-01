class UpdateSender < ActionMailer::Base
  include SendGrid
  sendgrid_category "TeamUpdate"


  def send_update_email(subject, body, investor)
    mail( :from => "game@startupbus.com",
          :to => investor.email,
          :subject => subject,
          :body => body)
  end
end
