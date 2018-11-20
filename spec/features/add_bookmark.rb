feature "Add bookmark" do
  scenario "Fill in form and submit" do
    visit "/add"
    fill_in('link', :with => 'http://www.idislikeapple.com')
    click_button('submit')
    expect(page).to have_content "http://www.idislikeapple.com"
  end
end
