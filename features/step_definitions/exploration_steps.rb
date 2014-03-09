Given(/^I am currently on any page$/) do
  visit root_path
end

When(/^I click on poems list link$/) do
  click_on('See all poems')
end

