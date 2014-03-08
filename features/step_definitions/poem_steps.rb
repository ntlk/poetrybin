When(/^I go to the home page$/) do
  visit root_path
end

Given(/^some poems exists$/) do
  Poem.create(title: 'A poem', body: 'Violets are red')
  Poem.create(title: 'A poem two', body: 'Violets are blue')
end

Then(/^I see one of the poems$/) do
  poem = Poem.find_by_title(find('.title').text)
  expect(page).to have_content(poem.title)
  expect(page).to have_content(poem.body)
  expect(page).to have_content(poem.created_at)
end

Given(/^a poem exists$/) do
  @poem = Poem.create(title: 'A poem', body: 'Violets are red')
end

When(/^I go straight to poem's individual page$/) do
  visit poem_path(@poem)
end

Then(/^I can read it in full$/) do
  expect(page).to have_content(@poem.title)
  expect(page).to have_content(@poem.body)
  expect(page).to have_content(@poem.created_at)
end
