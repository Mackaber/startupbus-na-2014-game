require "twilio-ruby"

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

  def send_message_sms(body, conductor, buspreneur)
    DeviseApp::Application.config.twilio_client.account.messages.create(
      :from => ENV['TWILIO_FROM_NUMBER'],
      :to => buspreneur.phone_number,
      :body => "StartupBus Message From #{conductor.name}: #{body}"
    )
  end
end
