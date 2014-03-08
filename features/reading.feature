Feature: reading poems
  as a reader
  I want to be able to read poems
  so I can enjoy them

  Scenario: read a random poem
    When I go to the home page
    Then I see a random poem

  Scenario: see a list of all poems
    When I go to the poems list
    Then I see a list of all the poem titles or excerpts arranged chronologically

  Scenario: read a specific poem
    When I go straight to poem's individual page
    Then I can read it in full

  Scenario: finding a poem
    Given that I see a poem I want to read on the list pgae
    When I select it
    Then I can read it in full


