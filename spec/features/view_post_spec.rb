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
  end

  scenario 'can request a booking and see confirmation' do
    insert_users_into_test_database
    insert_posting_into_test_database
    log_in_as_second_user
    click_button 'View Listings'
    click_button 'Book'
    click_button 'Request Booking'
    expect(page).to have_content "Booking Confirmed"
  end
end
