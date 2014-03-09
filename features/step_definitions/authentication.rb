Given(/^that I'm on the login page$/) do
  visit admin_access_path
end

When(/^I input my credentials$/) do
  fill_in('Password', with: ENV['PASSWORD'])
  click_on('Log in')
end

Then(/^I am logged in$/) do
  expect(page).to have_link('Logout')
end
