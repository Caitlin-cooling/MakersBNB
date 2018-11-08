feature 'Accept booking' do
  scenario 'owner accepts booking' do
    request_booking_as_second_user
    click_button 'Home'
    click_button 'Log out'
    log_in
    click_button 'Your received bookings'
    click_button 'Accept'
    expect(page).to have_content('Confirmed')
  end
end
