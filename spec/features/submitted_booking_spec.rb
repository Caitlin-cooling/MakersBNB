feature 'User booking' do
  scenario 'User view submitted booking' do
    request_booking_as_second_user
    click_button 'Home'
    click_button 'Log out'
    log_in
    click_button 'Your received bookings'
    click_button 'Accept'
    click_button 'Home'
    click_button 'Log out'
    log_in_as_second_user
    click_button 'Your submitted bookings'
    expect(page).to have_content('My first posting')
    expect(page).to have_content('Description')
    expect(page).to have_content('£100')
  end
end
