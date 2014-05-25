require "spec_helper"

feature 'Admin registration' do

  scenario 'Admin views sign up page and creates an account' do

    visit admin_sign_up_path

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Organization Name', with: 'Titan'

    click_button 'Sign up'

    visit '/organizations'

    expect(page).to have_text 'Titan'

  end

end

