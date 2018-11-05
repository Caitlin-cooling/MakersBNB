feature 'new postings' do
  scenario 'user can add a new posting' do
    visit('/postings/new')
    expect(page).to have_content("List a space")
    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
    expect(page).to have_content("Price per night (£)")
    expect(page).to have_content("Available from (DD/MM/YY)")
    expect(page).to have_content("Available to (DD/MM/YY)")
    expect(page).to have_selector(:button, "Submit")
  end

end
