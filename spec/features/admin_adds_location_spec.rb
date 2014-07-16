require 'spec_helper'

feature 'Location creation' do
  pending 'An admin creates a location and is shown the location' do
    organization = create(:organization)
    admin = create(:admin, organization: organization)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)

    #longitude and latitude need to be filled in

    login_as(user, scope: :user)

    visit new_location_path

    fill_in 'Name', with: 'Farm'
    fill_in 'location_address', with: '1234 Main Street'
    fill_in 'Days and Hours', with: '24/7'

    click_button 'Add Location'

    expect(page).to have_text('Amboy Farm')

  end

end
