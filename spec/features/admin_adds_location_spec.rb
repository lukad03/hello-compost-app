require 'spec_helper'

feature 'Location creation' do
  pending 'An admin creates a location and is shown the location' do
    organization = create(:organization)
    admin = create(:admin, organization_id: organization.id)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)

    login_as(user, scope: :user)

    visit new_location_path

    fill_in 'Name', with: 'Amboy Farm'
    fill_in 'Address', with: '1234 Main Street'

    click_button 'Add Location'

    expect(page).to have_text('Amboy Farm')

  end

end
