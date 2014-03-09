Given(/^I am currently on any page$/) do
  visit root_path
end

When(/^I click on poems list link$/) do
  click_on('See all poems')
end

When(/^I click on random poem link$/) do
  click_on('Random')
end

Then(/^I see a random poem in full$/) do
  expect_page_to_have_poem(Poem.first)
end

