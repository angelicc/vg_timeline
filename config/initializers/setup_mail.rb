ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "divaor",
  :password             => "13579-",
  :authentication       => "plain",
  :enable_starttls_auto => true
}