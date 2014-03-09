Given(/^that I'm on the login page$/) do
  visit new_session_path
end

When(/^I input my credentials$/) do
  fill_in('Password', with: ENV['PASSWORD'])
  click_on('Log in')
end

Then(/^I am logged in$/) do
  expect(page).to have_button('Logout')
end

Given(/^that I am logged in as an admin$/) do
  visit new_session_path
  fill_in('Password', with: ENV['PASSWORD'])
  click_on('Log in')
end

When(/^I input invalid credentials$/) do
  visit new_session_path
  fill_in('Password', with: 'pa$$word')
  click_on('Log in')
end

When(/^I log out$/) do
  click_on('Logout')
end

Then(/^I am logged out$/) do
  expect(page).to have_no_link('Logout')
end
