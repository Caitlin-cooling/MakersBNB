feature 'logging in' do
  before do
    visit '/'
    click_button 'Log in'
    insert_users_into_test_database
  end

  scenario 'clicking login button takes user to login page' do
    expect(page).to have_current_path '/log_in'
  end

  scenario 'user can log in with their details' do
    log_in
    expect(page).to have_content 'Welcome Stan Testson'
  end

  scenario 'user cannot log in if email is incorrect' do
    fill_in :email, with: 'dan@stan.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
    expect(page).to have_content 'Email or password is incorrect.'
  end
end
