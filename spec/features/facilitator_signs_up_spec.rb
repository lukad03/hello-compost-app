require 'spec_helper'

feature 'Facilitator Registration' do

  scenario 'Facilitator visits registration page and creates an account' do
    organization = create( :organization)

    visit new_organization_facilitator_path(organization.name)

    fill_in 'Name', with: 'James Bond'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign Up'

    expect(page).to have_text 'Welcome!'

  end

end
