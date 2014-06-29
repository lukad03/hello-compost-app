require "spec_helper"

feature 'Admin registration' do

  scenario 'Admin visits admin sign up page and signs up' do

    visit new_admin_path

    fill_in 'Name', with: 'Jon Doe'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Organization Name', with: 'Skyfall'

    click_button 'Sign Up'

    expect(page).to have_text 'Skyfall'

  end

end

