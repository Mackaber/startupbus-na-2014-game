# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DeviseApp::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "game.startupbus.com",
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD']
}
