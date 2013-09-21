unless Rails.env.test? # we don't want tests attempting to send out email
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => ENV["EMAIL_SERVER_ADDRESS"],
    :port => 25,
    :authentication => :plain,
    :enable_starttls_auto => true,
    :user_name => ENV["SENDGRID_USERNAME"],
    :password => ENV["SENDGRID_PASSWORD"],
    :domain => ENV["BASE_DOMAIN"]
  }
end

ActionMailer::Base.default_url_options[:host] = ENV["APPLICATION_URL"]