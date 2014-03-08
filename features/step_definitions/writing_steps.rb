Given(/^that I'm on the new poem page$/) do
  visit new_poem_path
end

When(/^I type in a poem$/) do
  fill_in('Title', with: 'A title')
  fill_in('Poem', with: 'Some poem body\nWith basic formatting')
  click_on('Save')
end

Then(/^it appears on the site$/) do
  expect_page_to_have_poem(Poem.find_by_title('A title'))
end

