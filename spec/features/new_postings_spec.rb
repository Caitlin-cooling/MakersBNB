feature 'new postings' do
  scenario 'user can add a new posting' do
    visit('/postings/new')
    expect(page).to have_content("list a space")

    expect(page).to have_css("input[type='text'][placeholer='Title']")
    expect(page).to have_css("input[type='text'][placeholer='Description']")
    expect(page).to have_content("Price")
    expect(page).to have_content("Available From")
    expect(page).to have_content("Available To")
    expect(page).to have_selector(:link_or_button, 'List my space')
  end

end
