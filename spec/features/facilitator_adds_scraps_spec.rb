require "spec_helper"

feature 'Scrap creation' do

  scenario 'Facilitator logs in and adds client scrap' do
    organization = FactoryGirl.create(:organization, name: 'Cheeroio')
    facilitator = FactoryGirl.create(:admin, organization: organization)
    user = FactoryGirl.create(:user, rolable_type: 'Admin', rolable_id: facilitator.id)
    client = FactoryGirl.create( :client, username: 'resident' )
    location = FactoryGirl.create(:location)

    login_as(user)

    visit new_location_scrap_path(location)
    fill_in 'scrap_weight', with: '2.27'
    select 'resident', from: 'scrap_client_id'

    click_button 'Create Scrap'

    expect(page).to have_text('resident')
    expect(page).to have_text('2.27')

    visit client_path(client)
    expect(page).to have_text('resident')
    expect(page).to have_text('227 Credits')

  end

end
