require "spec_helper"

feature 'Admin registration' do

  pending 'Admin views sign up page and creates an account' do

    visit admin_sign_up_path

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Organization Name', with: 'Titan'

    click_button 'Sign up'

    visit '/organizations'

    expect(page).to have_text 'Titan'

  end

  scenario 'Admin uses admin controller to sign up' do

    visit new_admin_path

    fill_in 'Name', with: 'Jon Doe'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Organization Name', with: 'Skyfall'

    click_button 'Sign Up'

    expect(page).to have_text 'Skyfall'

  end

end

