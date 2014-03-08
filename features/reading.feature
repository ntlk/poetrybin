Feature: reading poems
  as a reader
  I want to be able to read poems
  so I can enjoy them

  Scenario: read a random poem
    Given some poems exist
    When I go to the home page
    Then I see one of the poems

  Scenario: see a list of all poems
    Given some poems exist
    When I go to the poems list
    Then I see a list of all the poem titles or excerpts
      And they're arranged chronologically

  Scenario: read a specific poem
    Given a poem exists
    When I go straight to poem's individual page
    Then I can read it in full

  Scenario: finding a poem
    Given that I see a poem I want to read on the list pgae
    When I select it
    Then I can read it in full


