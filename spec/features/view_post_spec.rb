feature 'view post' do
  scenario 'Shows the posters details' do
    sign_up_as_test_user
    click_button "New Post"
    fill_in :title, with: "Cool new place!"
    fill_in :description, with: "You will love it!"
    fill_in :price, with: 5
    click_button "Submit"
    # save_and_open_page
    click_button "Book"
    expect(page).to have_content "stan@stan.com"
    expect(page).to have_content "Cool new place!"
    expect(page).to have_content "You will love it!"
    expect(page).to have_content "The price is: £5"
    expect(page).to have_content "Stan Testson"
  end
end
