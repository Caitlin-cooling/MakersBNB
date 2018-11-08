feature 'User booking' do
  scenario 'User view submitted booking' do
log_in_as_two_users_accept_booking
    log_in_as_second_user
    click_button 'Your submitted bookings'
    expect(page).to have_content('My first posting')
    expect(page).to have_content('Description')
    expect(page).to have_content('£100')
    expect(page).to have_content('Confirmed')
  end
end
