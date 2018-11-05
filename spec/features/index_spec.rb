feature 'home page' do
  scenario 'viewing the title' do
    visit '/'
    expect(page).to have_content 'Welcome to MakersBnB!'
  end
end
