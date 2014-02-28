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
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    client.account.messages.create(
      :from => ENV['TWILIO_FROM_NUMBER'],
      :to => buspreneur.phone_number,
      :body => "From #{conductor.name} :: #{body} :: StartupBus SMS Powered by Twilio"
    )
  end
end
