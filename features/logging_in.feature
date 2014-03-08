Feature: logging in
  as an admin
  I want to be able to log in
  so I can combat spam

  Scenario: loggin in
    Given that I know the login url
    When I visit it I can input my credentials
    Then I am logged in
      And can hide and unhide poems
      And can see hidden poems

  Scenario: logging out
    Given that I am logged in as an admin
    When I log out
    Then I am logged out
      And cannot hide and unhide poems
      And cannot see hidden poems


