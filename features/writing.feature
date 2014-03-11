Feature: writing poems
  as a poet
  I want to write and save a poem
  so I can share it anonymously

  Scenario: create a new poem
    Given that I'm on the new poem page
    When I type in a poem
    Then it appears on the site

  Scenario: create a new poem with some formatting
    Given that I'm on the new poem page
    When I type in a poem with formatting
    Then it appears on the site with formatting

  @wip
  Scenario: create a new poem which includes html tags
    Given that I'm on the new poem page
    When I type in a poem with html
    Then it appears on the site with html tags escaped

  Scenario: edit existing poem
    Given that I have created a poem in the last 15 minutes
    When I go to edit poem page
    Then I can edit the title and body

