When(/^I go to the home page$/) do
  visit root_path
end

Given(/^some poems exist$/) do
  Poem.create(title: 'Another poem', body: 'Text', created_at: Date.tomorrow)
  Poem.create(title: 'A poem', body: 'Violets are red', created_at: 10.minutes.ago)
  Poem.create(title: 'A poem two', body: 'Violets are blue')
end

Then(/^I see one of the poems$/) do
  poem = Poem.find_by_title(find('.title').text)
  expect_page_to_have_poem(poem)
end

Given(/^a poem exists$/) do
  @poem = Poem.create(title: 'A poem', body: 'Violets are red')
end

When(/^I go straight to poem's individual page$/) do
  visit poem_path(@poem)
end

Then(/^I can read it in full$/) do
  expect_page_to_have_poem(@poem)
end

When(/^I go to the poems list$/) do
  visit poems_path
end

Then(/^I see a list of all the poem titles or excerpts$/) do
  Poem.all.each do |poem|
    expect(page).to have_link(poem.title, href: poem_path(poem))
    expect(page).to have_content(poem.created_at)
  end
end

Then(/^they're arranged chronologically$/) do
  dates = all('time').collect(&:text).map{|e| e.to_date}
  expect(dates).to eq dates.sort.reverse
end

When(/^I select a poem to read$/) do
  @poem = Poem.all.sample
  click_on(@poem.title)
end
