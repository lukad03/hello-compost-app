require "spec_helper"

feature 'Scrap creation' do
    scenario 'Facilitator logs in and adds client scrap' do
      organization = create(:organization)
      location = create(:location, organization: organization)
      client = create(:client, username: 'resident', location: location)

      facilitator_setup(organization)

      visit new_location_scrap_path(location.name)
      fill_in 'scrap_weight', with: '2.27'
      select 'resident', from: 'scrap_client_id'

      click_button 'Create Scrap'

      expect(page).to have_text('resident')
      expect(page).to have_text('2.27')

      visit client_path(client)
      expect(page).to have_text('resident')
      expect(page).to have_text('227/1000 Credits')
    end

    def organization
      create(:organization, name: 'Cheerio')
    end

    def facilitator_setup(organization)
      facilitator = create( :facilitator, organization: organization )
      user = create( :user, rolable_type: 'Facilitator', rolable_id: facilitator.id )

      login_as(user)
    end

end
