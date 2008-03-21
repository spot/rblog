# Email settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.nu2rails.com",
  :port => 25,
  :domain => "blog@nu2rails.com",
  :authentication => :login,
  :user_name => "blog@nu2rails.com",
  :password => "thejustice"  
}

