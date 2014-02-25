# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DeviseApp::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'bc00',
  :password => 'test1234',
  :domain => 'http://localhost:3000/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
