def expect_page_to_have_poem(poem)
  expect(page).to have_content(poem.title)
  expect(page).to have_content(poem.body)
  expect(page).to have_content(poem.created_at)
end


