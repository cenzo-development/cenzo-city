require 'rails_helper'

describe PasscodeGenerationContext do

  let(:user) {FactoryBot.create(:person_user, email: "frank@example.com")}
  let(:user_email) {user.email}

  describe "#call" do
    it "generates a unique passcode" do
      context = PasscodeGenerationContext.new(user_email)
      context.user.expects(:generate_passcode).at_most_once
      context.call
    end

    it "saves generated passcode for a user" do
      context = PasscodeGenerationContext.new(user_email)
      context.user.expects(:save).at_most_once.returns(true)
      context.call
    end

  end

end
