feature 'viewing submitted bookings' do
  scenario 'user can request a booking then view the request on a page' do
    request_booking_as_second_user
    click_button 'Home'
    click_button 'Your submitted bookings'
    expect(page).to have_current_path('/2/bookings/submitted')
    expect(page).to have_content 'stan@stan.com'
    expect(page).to have_content 'Cool new place!'
    expect(page).to have_content 'You will love it!'
    expect(page).to have_content 'The price is: £5'
    expect(page).to have_content 'Stan Testson'
  end
end
