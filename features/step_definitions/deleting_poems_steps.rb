When(/^I hide a poem$/) do
  visit poems_path
  click_on('Hide')
end

Then(/^the poem is removed from view$/) do
  expect(page).to have_no_link('Hide')
end
