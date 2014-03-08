Feature: deleting poems
  as an admin
  I want to be able to delete poems
  to combat spam

  Scenario: hide poems
    given that I am logged in as an admin
    when I select multiple poems
    then they are marked as hidden
      and removed from view

  Scenario: unhide poems
    given that I am logged in as an admin
    when I select previously hidden poems
    then they are unmarked as hidden
      and they are visible again

  Scenario: delete poems
    given that poems have been marked as hidden
    when 7 days passed
    then they are permanently deleted


