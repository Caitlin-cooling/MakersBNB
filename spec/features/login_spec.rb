feature 'logging in' do
  before do
    visit '/'
    click_button 'Log in'
  end

  scenario 'clicking login button takes user to login page' do
    expect(page).to have_current_path '/log_in'
  end
end
