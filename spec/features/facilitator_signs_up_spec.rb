require 'spec_helper'

feature 'Facilitator Registration' do

  scenario 'Facilitator visits registration page and creates an account' do
    organization = create(:organization)
    invite = create(:invite, email: 'user2@email.com')
    location = create(:location, name: 'Test Location', organization: organization)
    invite_location = create(:invite_location, invite: invite,
                                               location: location)
    client = create(:client, organization: organization,
                             location: location)

    visit new_organization_facilitator_path(organization.name)

    fill_in 'Name', with: 'James Bond'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign Up'

    expect(page).to have_text 'Welcome!'
    expect(first_location).to have_text 'Test Location'

  end

  private

  def first_location
    page.first('.locations h2')
  end

end
