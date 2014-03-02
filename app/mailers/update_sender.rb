class UpdateSender < ActionMailer::Base
  include SendGrid
  sendgrid_category "TeamUpdate"

  def send_update_email(subject, body, investor)
    @str = body
    mail(:from => "game@startupbus.com",
          :to => investor.email,
          :subject => subject) do |format|
            format.html { render "notifier/update_email" }
          end
  end
end
