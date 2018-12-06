class SendPasscodeContext
  include Hooks

  define_hooks :after_call

  after_call :encrypt_passcode

  def self.call(user)
    new(user).call
  end

  def initialize(user)
    @mobile_number = user.mobile_phone
    @usr = user
    @passcode = user.pass_code
    @code_sender = PasscodeSender.new
  end

  def call
    @code_sender.send_passcode(@mobile_number, @passcode)
    self.run_hook :after_call
  end

  def encrypt_passcode
    @usr.write_attributes(pass_code: Digest::SHA512.hexdigest(@passcode))
    @usr.save
  end

end
