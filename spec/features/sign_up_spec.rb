feature 'Confirm Sign up' do
  before do
    sign_up_as_test_user
  end

  scenario 'user sees name on page after signing up' do
    expect(page).to have_current_path '/1/home'
    expect(page).to have_content 'Welcome Stan Testson'
  end
end
