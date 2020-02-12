# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'When landing on root page' do
  scenario 'get to index without login' do
    visit root_url
    expect(page).to have_content('Log in')
  end
  scenario 'logged in visitor gets to his page' do
    user = FactoryBot.create(:user)
    visit root_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Biography')
  end
end

RSpec.feature 'When trying to visit page directly' do
  scenario 'get to users_page without login' do
    visit users_path
    expect(page).to have_content('Log in')
  end
  scenario 'logged in visitor gets to his page' do
    user = FactoryBot.create(:user)
    visit root_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit users_path
    expect(page).to have_content('Current Users')
  end
end
