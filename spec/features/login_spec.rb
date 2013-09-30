require 'spec_helper'

feature 'logging in a registered user', js: true do
  scenario 'home page should have sign in link' do
    visit '/'
    sleep(200)
    within("div#login") do
      find_content('log in')
      expect(page).to have_content('log in')
    end
  end

end