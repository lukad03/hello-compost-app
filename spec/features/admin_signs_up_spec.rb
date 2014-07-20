require "spec_helper"

feature 'Admin registration' do

  scenario 'Admin visits admin sign up page and signs up' do

    visit new_admin_path

    fill_in 'admin_name', with: 'Jon Doe'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'admin_organization_attributes_name', with: 'Skyfall'

    click_button 'Sign Up'

    expect(page).to have_text 'Skyfall'
    expect(page).to have_text 'Welcome To'

  end

end

