feature 'Index page' do
  scenario 'Setup test' do
    visit '/'
    expect(page).to have_content "Welcome to the bookmark manager."
  end
end
