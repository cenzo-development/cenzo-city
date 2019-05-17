class PasswordResetContext

  def self.call(user_email)
    new(user_email).call
  end

  def initialize(user_email)
    if @user = Person::User.find_by(email: user_email)
      assign_password_reset(@user)
    end
  end

  def call
    if !@decorated_object.nil
      @decorated_object.send_password_reset
      @decorated_object.run_hook :after_send_password_reset
    else
      return nil
    end
  end

  private

  def assign_password_reset(user)
    @decorated_object = PasswordReseter.new(user)
  end


end
