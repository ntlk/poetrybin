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
