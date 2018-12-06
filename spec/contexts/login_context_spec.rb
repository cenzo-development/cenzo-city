
require 'rails_helper'

describe LoginContext do
  let(:user) {FactoryBot.create(:person_user, email: "frank@example.com", password: "pa$$word")}
  let(:login_info) {LoginCredentials.new(user.email, user.password)}

  describe "#call" do
    it "verify's user email and password combination" do
      context = LoginContext.new(login_info.email, login_info.password)
      Person::User.expects(:find_by).with(email: login_info.email).at_most_once
      context.user.expects(:authenticate_user).with(login_info.password).at_most_once
      context.call
    end

    it "returns true with correct email and password combination" do
      context = LoginContext.new(login_info.email, login_info.password)
      expect(context.call).to eq true
    end

    it "returns false with incorrect password and correct email" do
      context = LoginContext.new(login_info.email, "doggy7777")
      expect(context.call).to eq false
    end

    it "returns false with incorrect email and correct password" do
      context = LoginContext.new("fred@mail.com", "login_info.password")
      expect(context.call).to eq false
    end
  end

end
