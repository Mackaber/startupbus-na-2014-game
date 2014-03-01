# Load the Rails application.
require File.expand_path('../application', __FILE__)

# sets a constant containing the environment-specific settings defined in the yml config file
Dir.glob( "config/constants/*" ).each do |file|
  Kernel.const_set File.basename(file, ".yml").upcase, YAML::load_file(File.join(Rails.root, file))[Rails.env]
end

# Initialize the Rails application.
DeviseApp::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "startupbus.com",
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD']
}