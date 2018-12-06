class PasswordReseter < SimpleDelegator
  include Hooks

  define_hooks :after_send_password_reset

  after_send_password_reset do
    UserMailer.forgot_password(self).deliver
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save
  end

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64 if Person::User.where(column => self[column])
  end 

  private :generate_token

end
