Feature: deleting poems
  as an admin
  I want to be able to delete poems
  to combat spam

  Scenario: hide poems
    Given that I am logged in as an admin
    When I select multiple poems
    Then they are marked as hidden
      And removed from view

  Scenario: unhide poems
    Given that I am logged in as an admin
    When I select previously hidden poems
    Then they are unmarked as hidden
      And they are visible again

  Scenario: delete poems
    Given that poems have been marked as hidden
    When 7 days passed
    Then they are permanently deleted


