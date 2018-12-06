require 'rails_helper'

describe PasscodeVerificationContext do

  let(:user) {FactoryBot.create(:person_user, pass_code: Digest::SHA512.hexdigest('555555'))}
  let(:code) {"555555"}

  describe "#call" do
    context "Valid passcode" do
      it "should return true when passcode is valid and verified" do
        context = PasscodeVerificationContext.new(user, code)
        context.user.expects(:verify_psaacode).with(code).at_most_once.returns(true)
        context.call
      end
      it "should return false when passcode is valid but un-verified" do
          context = PasscodeVerificationContext.new(user, '876555')
          context.user.expects(:verify_psaacode).with(code).at_most_once.returns(false)
          context.call
      end
    end
    context "Invalid passcode" do
      it "should return false when passcode is nil" do
        context = PasscodeVerificationContext.new(user, nil)
        result = context.call
        expect(result).to be false
      end
      it "should returun false when passcode is non-numeric" do
        context = PasscodeVerificationContext.new(user, "aaaaaa")
        result = context.call
        expect(result).to be false
      end
      it "should return false when passcode length is less then six" do
        context = PasscodeVerificationContext.new(user, '5555')
        result = context.call
        expect(result).to be false
      end
    end
  end

end
