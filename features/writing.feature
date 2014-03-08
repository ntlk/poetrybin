Feature: writing poems
  as a poet
  I want to write and save a poem
  so I can share it anonymously

  Scenario: create a new poem
    when I go to new poem page
    then I can add a title
      and body text with basic formatting
      and save it

  Scenario: edit existing poem
    given that I have created a poem in the last 15 minutes
    when I go to edit poem page
    then I can edit the title and body

