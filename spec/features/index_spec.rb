feature 'home page' do
  before do
    visit '/'
  end

  scenario 'viewing the title' do
    expect(page).to have_content 'MakersBnB'
  end

  scenario 'viewing sign up form' do
    expect(page).to have_css("input[type='text'][placeholder='Name']")
    expect(page).to have_css("input[type='text'][placeholder='Email']")
    expect(page).to have_css("input[type='password'][placeholder='Password']")
    expect(page).to have_css("input[type='submit'][value='Submit']")
  end

  scenario 'view login button' do
    expect(page).to have_css("input[type='submit'][value='Log in']")
  end
end
