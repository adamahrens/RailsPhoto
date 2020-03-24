# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Sendgrid
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => Rails.application.credentials.sendgrid[:api_key],
  :domain => 'localhost:3000',
  :address => '*.smtp.sendgrid.net',
  :port => 465,
  :tls => true,
  :ssl => true,
  :authentication => :plain,
  :enable_starttls_auto => true
}
