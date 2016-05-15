require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to signup' do
    visit root_path
    expect(page).to have_link('Signup')
    click_link 'Signup'

    fill_in 'Name', with: 'bob'
    fill_in 'Cell phone number', with: '303.555.1234'
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Password', with: 'sup3rs3krit'
    fill_in 'Password confirmation', with: 'sup3rs3krit'
    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as Bob')
  end
end
