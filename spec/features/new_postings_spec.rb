feature 'new postings' do

  before do
    visit('/postings/new')
  end

  scenario 'user can add a new posting' do
    expect(page).to have_content("List a space")
    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
    expect(page).to have_content("Price per night (£)")
    expect(page).to have_content("Available from (DD/MM/YY)")
    expect(page).to have_content("Available to (DD/MM/YY)")
    expect(page).to have_selector(:button, "Submit")
  end

  scenario 'after posting a new posting, user ends up on overview page' do
    fill_in :title, with: "Cool new place!"
    fill_in :description, with: "You will love it!"
    click_button "Submit"
    expect(page).to have_content("Cool new place!")
  end

end
