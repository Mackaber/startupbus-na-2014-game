class MessageSender < ActionMailer::Base
  include SendGrid
  sendgrid_category "ConductorMail"


  def send_message_email(subject, body, conductor, buspreneur)
    sendgrid_disable :subscriptiontrack
    mail( :from => conductor.email,
          :to => buspreneur.email,
          :subject => subject,
          :body => body)
  end
end
