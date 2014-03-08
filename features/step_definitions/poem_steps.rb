Given(/^a poem exists$/) do
  @poem = Poem.create()
end

When(/^I go straight to poem's individual page$/) do
  visit poem_path(@poem)
end
