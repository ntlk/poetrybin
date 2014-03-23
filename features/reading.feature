Feature: reading poems
  as a reader
  I want to be able to read poems
  so I can enjoy them

  Scenario: read a random poem
    Given some poems exist
    When I go to the home page
    Then I see one of the poems

  Scenario: reading random poems never brings up hidden ones
    Given some poems that include hidden ones exist
    When I go to the home page
    Then I never see a hidden one

  Scenario: see a list of all poems
    Given some poems exist
    When I go to the poems list
    Then I see a list of all poems
      And they're arranged chronologically

  @wip
  Scenario: see a list of poems some of which don't have titles
    Given some poems without titles exist
    When I go to the poems list
    Then I see a list of all poems

  Scenario: read a specific poem
    Given a poem exists
    When I go straight to poem's individual page
    Then I can read it in full

  Scenario: finding a poem
    Given some poems exist
      And I go to the poems list
    When I select a poem to read
    Then I can read it in full


