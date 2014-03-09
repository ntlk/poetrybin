Feature: deleting poems
  as an admin
  I want to be able to delete poems
  to combat spam

  Background:
    Given a poem exists

  Scenario: hide poems
    Given that I am logged in as an admin
    When I hide a poem
    Then the poem is removed from view

  Scenario: unhide poems
    Given that I am logged in as an admin
    When I select previously hidden poems
    Then they are unmarked as hidden
      And they are visible again

  Scenario: delete poems
    Given that poems have been marked as hidden
    When 7 days passed
    Then they are permanently deleted


