Feature: exploring the site
  as a visitor
  I want to be able to discover all things possible on the site through navigation
  so I can discover what I can do with poetrybin

  Scenario: discovering poems list
    given that I am currently on any page
    when I click on poems list link
    then I see the list of all poems

  Scenario: discovering a random poem
    given that I am currently on any page
    when I click on random poem link
    then I see a random poem in full

  Scenario: discovering adding poem
    given that I am currently on any page
    when I click on new poem link
    then I can create a new poem
