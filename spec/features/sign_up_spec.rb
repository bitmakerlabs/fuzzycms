require 'spec_helper'

feature 'Signing up', js: true do

  scenario 'should have a sign up link on the home page' do
    visit '/'
    expect(page).to have_content("Sign up")
  end

  scenario 'clicking sign up link should allow me to sign up' do
    visit('/')
    click_link 'Sign up'

    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password confirmation')
  end

  scenario 'should be able to sign up' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Create User'

    expect(page).to have_content('Successfully signed up')
  end
end