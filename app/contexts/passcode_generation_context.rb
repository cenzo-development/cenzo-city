
class PasscodeGenerationContext

  attr_reader :user

  def self.call(user_email)
    new(user_email).call 
  end

  def initialize(user_email)
    @user = Person::User.find_by(email: user_email)
    assign_passcode_generator(@user)
  end

  def call
    code = @decorated_object.generate_passcode
    @decorated_object.pass_code = code
    @decorated_object.save
  end

  private

  def assign_passcode_generator(user)
    @decorated_object = PassCodeGenerator.new(user)
  end

end
