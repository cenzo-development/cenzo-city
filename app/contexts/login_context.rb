class LoginContext

  attr_reader :user

  def self.call(login_credentials)
    new(login_credentials.email, login_credentials.password).call
  end

  def initialize(user_email, user_password)
    begin
      @user = Person::User.find_by(email: user_email)
      @password = user_password
      assign_login(@user)
    rescue Mongoid.Errors.DocumentNotFound => e
      raise e
    end 
  end

  def call
    @decorated_user.authenticate_user(@password)
  end

  private

  def assign_login(user)
    @decorated_user = Login.new(user)
  end

end
