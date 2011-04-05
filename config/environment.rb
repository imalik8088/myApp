# Load the rails application
require File.expand_path('../application', __FILE__)

# Actionmailer Konfiguration
#config.action_mailer.delivery_method = :sendmail

# MyApp::Application.configure do 
#   config.action_mailer.delivery_method = :sendmail
# end

MyApp::Application.configure do 
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :address                => "smtp.gmail.com",
    :port                   => 587,
    :domain                 => "test.com",
    :user_name              => "dbconsole2011",
    :password               => "***SECRET***",
    :authentication         => "plain",
    :enable_starttls_auto   => true
}
end

# Initialize the rails application
MyApp::Application.initialize!
