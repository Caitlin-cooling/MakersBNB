feature 'view post' do
  scenario 'Shows the posters details' do
    sign_up_as_test_user
    create_new_posting
    click_button 'Book'
    expect(page).to have_content 'stan@stan.com'
    expect(page).to have_content 'Cool new place!'
    expect(page).to have_content 'You will love it!'
    expect(page).to have_content 'The price is: £5'
    expect(page).to have_content 'Stan Testson'
    expect(page).to have_content 'Available from: 2018-11-06'
    expect(page).to have_content 'Available to: 2018-11-07'
  end

  scenario 'can request a booking and see confirmation' do
    request_booking_as_second_user
    expect(page).to have_content 'Booking Requested'
  end

  scenario 'can click button to return to user home page' do
    request_booking_as_second_user
    click_button 'Home'
    expect(page).to have_current_path '/2/home'
  end
end
