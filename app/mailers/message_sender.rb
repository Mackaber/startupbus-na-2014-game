class MessageSender < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack, :clicktrack

  def send_message_email(subject, body, conductor, buspreneur)
    mail( :from => conductor.email,
          :to => buspreneur.email,
          :subject => subject,
          :body => body)
  end
end
