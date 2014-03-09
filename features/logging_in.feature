Feature: logging in
  as an admin
  I want to be able to log in
  so I can combat spam

  Scenario: logging in
    Given that I'm on the login page
    When I input my credentials
    Then I am logged in

  Scenario: logging out
    Given that I am logged in as an admin
    When I log out
    Then I am logged out

  Scenario: logging in with the wrong password
    Given that I'm on the login page
    When I input invalid credentials
    Then I am logged out

