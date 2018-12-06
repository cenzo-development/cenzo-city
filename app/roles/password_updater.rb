class PasswordUpdater < SimpleDelegator

  def update_password(form)
    raise StandardError, "Password reset has expired" if self.password_reset_sent_at < 2.hour.ago
    self.write_attributes(password: form.password, password_confirmation: form.password_confirmation)
  end
