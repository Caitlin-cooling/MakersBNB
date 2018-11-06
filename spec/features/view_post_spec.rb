feature 'view post' do
  scenario 'Shows the posters email' do
    sign_up_as_test_user
    click_button "New Post"
    fill_in :title, with: "Cool new place!"
    fill_in :description, with: "You will love it!"
    fill_in :price, with: 5
    click_button "Submit"
    # save_and_open_page
    click_button "Book"
    expect(page).to have_content "stan@stan.com"
  end
end
