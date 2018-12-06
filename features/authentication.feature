Feature: Authentication

  In order to use the system
  As a user
  I should be able to log in with a valid email and password combination
  and a valid unique code


  Scenario: User Logs In with email and password
    Given I am a registered user
    And I visit the login page
    When I fill in the login form
    Then I should be redirected to the mobile number confirmation page


  Scenario: User confirms mobile number
    Given I am a registered user
    And I am on the mobile number confirmation page
    When I click on send verification code button
    Then I should be redirected to the code submission page


  Scenario: User Logs in with unique code
    Given I am a registered user
    And I am on the code submission page
    When I fill in the code submission form
    Then I should be redirected to the home page
