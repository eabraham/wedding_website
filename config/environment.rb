# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Ericandasmita::Application.initialize!

=begin
ActionMailer::Base.smtp_settings = {
  :user_name => 'eabrahamsen',
  :password => 'duncan30',
  :domain => 'ericandasmita.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
=end