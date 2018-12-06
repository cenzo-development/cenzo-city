require 'rails_helper'


describe SessionCreationContext do
  let(:user) {FactoryBot.create(:person_user, email: "frank@example.com", password: "pa$$word")}
  let(:user_email) {user.email}
  let (:req) {Rack::Request.new({})}
  let(:controller) {SessionsController.new}
  
  describe "#call" do
    it "registers a session id for a user" do
      controller.stubs(:session).returns({})
      context = SessionCreationContext.new(user_email, controller)
      context.controller.expects(:session).at_most_once
      context.call
      expect(context.controller.session[:user_id]).to eq user.id
    end
  end
end
