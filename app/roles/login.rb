

class Login < SimpleDelegator

  def authenticate_user(password)
    return false unless self.authenticate(password)
    true
  end

end
