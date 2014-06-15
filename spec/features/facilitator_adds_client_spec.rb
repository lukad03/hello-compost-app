require 'spec_helper'

feature 'New Client' do
  scenario 'Facilitator adds a client to a location' do
    facilitator_setup

    visit new_location_client_path(location.name)

    fill_in 'client_username', with:'new_client'

    click_button 'Add Client'

    expect(page).to have_text 'Client Added'

  end

  def facilitator_setup
    organization = FactoryGirl.create(:organization, name: 'Cheeroio')
    facilitator = FactoryGirl.create(:admin, organization: organization)
    user = FactoryGirl.create(:user, rolable_type: 'Admin', rolable_id: facilitator.id)
    client = FactoryGirl.create( :client, username: 'resident' )

    login_as(user)
  end

  def location
    location = FactoryGirl.create(:location, name: 'Location Name')
  end
end

