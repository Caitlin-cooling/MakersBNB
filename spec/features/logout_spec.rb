feature 'logging out' do
  scenario 'user can log out after logging in' do
    sign_up_as_test_user
    click_button "Log out"
    expect(page).to have_current_path '/'
    expect(page).to have_content 'You have signed out.'
  end
end
