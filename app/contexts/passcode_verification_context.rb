

class PasscodeVerificationContext

  attr_reader :user

  def self.call(user, code)
    new(user, code).call
  end

  def initialize(user, code)
    @user = user
    @code = code
    assign_passcode_verifier(@user)
  end

  def call
    @decorated_object.verify_psaacode(@code)
  end

  private

  def assign_passcode_verifier(user)
    @decorated_object = PasscodeVerifier.new(user)
  end

end
