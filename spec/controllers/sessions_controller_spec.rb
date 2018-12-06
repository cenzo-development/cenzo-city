require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) {FactoryBot.create(:person_user, email: "frank@example.com", password: "pa$$word")}
  let(:login_info) {LoginCredentials.new(user.email, user.password)}
  let(:login_info_wrong_password) {LoginCredentials.new(user.email, "zzzzzzzz")}
  let(:login_info_wrong_email) {LoginCredentials.new("doggy@mail.com", user.password)}

  describe "POST #create" do
    context "email and password login" do
      it "verifies login credentials" do
        LoginContext.expects(:call).with(login_info).at_most_once
        post :create, params: {email: login_info.email, password: login_info.password}
      end
      it "returns true with valid login credentials" do
        LoginContext.expects(:call).with(login_info).at_most_once.returns(true)
        post :create, params: {email: login_info.email, password: login_info.password}
      end
      it "returns false with incorrect password" do
        LoginContext.expects(:call).with(login_info_wrong_password).at_most_once.returns(false)
        post :create, params: {email: login_info_wrong_password.email, password: login_info_wrong_password.password}
      end
      it "returns false with incorrect email" do
        LoginContext.expects(:call).with(login_info_wrong_email).at_most_once.returns(false)
        post :create, params: {email: login_info_wrong_email.email, password: login_info_wrong_email.password}
      end
      it "creates a new user session" do
        post :create, params: {email: login_info.email, password: login_info.password}
        expect(subject.session[:user_id]).to_not be nil
      end
      it "generates unique passcode with valid login credentials" do
        PasscodeGenerationContext.expects(:call).with(login_info.email).at_most_once.returns(true)
        post :create, params: {email: login_info.email, password: login_info.password}
      end
      it "re-directs to mobile number confirmation page with valid login credentials" do
        post :create, params: {email: login_info.email, password: login_info.password}
        expect(response).to redirect_to confirm_mobile_path
      end
      it "should re-render new template with incorrect password" do
        post :create, params: {email: login_info.email, password: login_info_wrong_password.password}
        expect(response).to render_template "new"
      end
      it "should re-render new template with incorrect email" do
        post :create, params: {email: login_info_wrong_email.email, password: login_info.password}
        expect(response).to render_template "new"
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes the current user session" do
      SessionDestructionContext.expects(:call).with(subject).at_most_once
      delete :destroy
      expect(subject.session[:user_id]).to be nil
    end

    it "redirects to login page" do
      delete :destroy
      expect(response).to redirect_to new_session_path
    end
  end

end
