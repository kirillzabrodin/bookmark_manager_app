feature "Add bookmark" do
  scenario "Fill in form and submit" do
    visit "/add"
    fill_in('title', with: 'Test Bookmark')
    fill_in('new_link', :with => 'http://www.idislikeapple.com')
    click_button('submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.idislikeapple.com')
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
