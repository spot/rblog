class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "#{root_url}/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = root_url
  end
  
  def forgot_password(user)
    setup_email(user)
    @subject    += 'You have requested to change your password'
    @body[:url]  = "#{root_url}/reset_password/#{user.password_reset_code}" 
  end

  def reset_password(user)
    setup_email(user)
    @subject    += 'Your password has been reset.'
  end
  
  protected
  
  def setup_email(user)
          recipients "#{user.email}"
          from       %("Nu2Rails Admin" <admin@nu2rails.com>) # Sets the User FROM Name and Email
          subject    "[Nu2Rails] New account information "
          body       :user => user
    sent_on    Time.now
  end
end

