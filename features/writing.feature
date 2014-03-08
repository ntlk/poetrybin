Feature: writing poems
  as a poet
  I want to write and save a poem
  so I can share it anonymously

  Scenario: create a new poem
    When I go to new poem page
    Then I can add a title
      And body text with basic formatting
      And save it

  Scenario: edit existing poem
    Given that I have created a poem in the last 15 minutes
    When I go to edit poem page
    Then I can edit the title and body

