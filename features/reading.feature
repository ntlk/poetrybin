Feature: reading poems
  as a reader
  I want to be able to read poems
  so I can enjoy them

  Scenario: read a random poem
    when I go to the home page
    then I see a random poem

  Scenario: see a list of all poems
    when I go to the poems list
    then I see a list of all the poem titles or excerpts arranged chronologically

  Scenario: read a specific poem
    when I go straight to poem's individual page
    then I can read it in full

  Scenario: finding a poem
    given that I see a poem I want to read on the list pgae
    when I select it
    then I can read it in full


