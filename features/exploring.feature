Feature: exploring the site
  as a visitor
  I want to be able to discover all things possible on the site through navigation
  so I can discover what I can do with poetrybin

  Background:
    Given a poem exists

  Scenario: discovering poems list
    Given I am currently on any page
    When I click on poems list link
    Then I see a list of all poems

  Scenario: discovering a random poem
    Given I am currently on any page
    When I click on random poem link
    Then I see a random poem in full

  Scenario: discovering adding poem
    Given I am currently on any page
    When I click on new poem link
    Then I can create a new poem

  Scenario: finding out what Poetrybin is
    Given I am currently on any page
    When I click what is this link
    Then I can see the about page
