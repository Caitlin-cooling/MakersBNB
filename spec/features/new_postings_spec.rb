feature 'new postings' do

  scenario 'can get to new post page from user home page' do
    sign_up_as_test_user
    click_button "New Post"
    expect(page).to have_content "List a space"
  end

  scenario 'user can add a new posting' do
    visit('/postings/new')
    expect(page).to have_content("List a space")
    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
    expect(page).to have_content("Price per night (£)")
    expect(page).to have_content "Date Available"
    expect(page).to have_selector(:button, "Submit")
  end

  scenario 'after posting a new posting, user ends up on overview page' do
    create_new_posting
    expect(page).to have_content("Cool new place!")
  end
end
