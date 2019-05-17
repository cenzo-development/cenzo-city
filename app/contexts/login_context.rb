class LoginContext

  attr_reader :user

  def self.call(login_credentials)
      new(login_credentials.email, login_credentials.password).call
  end

  def initialize(user_email, user_password)
    if @user = Person::User.find_by(email: user_email)
      @password = user_password
      assign_login(@user)
    end
  end

  def call
    if !@decorated_user.nil?
      @decorated_user.authenticate_user(@password)
    else
      raise StandardError => e
    end
  end

  private

  def assign_login(user)
    @decorated_user = Login.new(user)
  end

end
