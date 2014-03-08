Feature: logging in
  as an admin
  I want to be able to log in
  so I can combat spam

  Scenario: loggin in
    given that I know the login url
    when I visit it I can input my credentials
    then I am logged in
      and can hide and unhide poems
      and can see hidden poems

  Scenario: logging out
    given that I am logged in as an admin
    when I log out
    then I am logged out
      and cannot hide and unhide poems
      and cannot see hidden poems


