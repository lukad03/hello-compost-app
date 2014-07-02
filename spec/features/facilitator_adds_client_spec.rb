require 'spec_helper'

feature 'New Client' do
  scenario 'Facilitator adds a client to a location' do
    facilitator_setup

    visit new_location_client_path(location.name)

    fill_in 'client_username', with:'new_client'

    click_button 'Add Client'

    expect(page).to have_text 'Client Added'

    visit organization_clients_path(organization)
    expect(page).to have_text 'new_client'

  end

  def organization
    create( :organization, name: 'Cheeroio' )
  end

  def facilitator_setup
    facilitator = create( :admin, organization: organization )
    user = create( :user, rolable_type: 'Admin', rolable_id: facilitator.id )

    login_as(user)
  end

  def location
    create( :location, name: 'Location Name', organization: organization )
  end
end

