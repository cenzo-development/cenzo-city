


Given("I am a registered user") do
    @registered = FactoryBot.create(:person_user, email: 'harry@mail.com', password: 'pa$$word', pass_code: "222222", mobile_phone: '0685291403')
end

Given("I visit the login page") do
  visit new_session_path
end

When("I fill in the login form") do
  fill_in 'email', with: @registered.email, disabled: false
  fill_in 'password', with: @registered.password, disabled: false
  click_button('Log In')
end

Then("I should be redirected to the mobile number confirmation page") do
  expect(current_path). to eq confirm_mobile_path
end

Given("I am on the mobile number confirmation page") do
  visit(confirm_mobile_path)
end

When("I click on send verification code button") do
  #pending # Write code here that turns the phrase above into concrete actions
  click_button('Send Verification Code')
end

Then("I should be redirected to the code submission page") do
  expect(current_path).to eq enter_code_path
  #pending # Write code here that turns the phrase above into concrete actions
end

Given("I am on the code submission page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in the code submission form") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be redirected to the home page") do
  pending # Write code here that turns the phrase above into concrete actions
end
