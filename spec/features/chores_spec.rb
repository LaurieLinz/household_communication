require 'rails_helper'

feature 'Chores' do
  scenario 'allows a user to create a chore' do
    user = FactoryGirl.create(:user)
    visit root_path

    expect(page).to have_link('Login')
    click_link('Login')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'
    expect(page).to have_text("Welcome back #{user.name.titleize}")
    expect(page).to have_text("Signed in as #{user.name}")
    expect(page).to have_text('Dashboard Welcome!')


    click_link('New Chore')

    fill_in 'Chore name', with: 'vaccum'
    fill_in 'Description', with: 'living room'
    fill_in 'User to complete', with: 'Bob'

    click_button 'Create Chore'
    click_link 'Back'
    expect(page).to have_text('Listing chores')
    expect(page).to have_text('vaccum')

  end
end
