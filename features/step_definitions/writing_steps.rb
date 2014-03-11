Given(/^that I'm on the new poem page$/) do
  visit new_poem_path
end

When(/^I type in a poem$/) do
  fill_in('Title', with: 'A title')
  fill_in('Poem', with: 'Some poem body with no formatting')
  click_on('Save')
end

Then(/^it appears on the site$/) do
  expect_page_to_have_poem(Poem.find_by_title('A title'))
end

When(/^I type in a poem with formatting$/) do
  fill_in('Title', with: 'A title')
  fill_in('Poem', with: 'Some poem body\nwith some formatting\n**bold** text\n*italics*\n# and font\n## sizes')
  click_on('Save')
end

Then(/^it appears on the site with formatting$/) do
  expect(page).to have_content('Some poem body<br>with some formatting<br>')
  expect(page).to have_content('<strong>bold</strong> text')
  expect(page).to have_content('<em>italics</em>')
  expect(page).to have_content('<span class="size-one">and font</span>')
  expect(page).to have_content('<span class="size-two">sizes</span>')
end

When(/^I type in a poem with html$/) do
  fill_in('Title', with: 'A title')
  fill_in('Poem', with: 'Some poem body <strong>with html</strong>')
  click_on('Save')
end

Then(/^it appears on the site with html tags escaped$/) do
  expect(page).to have_content('Some poem body &lt;strong&gt;with html&lt;/strong&gt;')
end
