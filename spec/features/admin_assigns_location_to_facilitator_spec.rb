require 'spec_helper'

feature 'Assign Locations' do
  scenario 'An admin updates a facilitator to have new locations' do
    organization = create(:organization, name: "Organization")
    location = create(:location, organization: organization, name: "Location1")
    admin = create(:admin, organization: organization)
    facilitator = create(:facilitator, organization: organization)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)

    login_as(user, scope: :user)

    visit organization_facilitator_path(organization.name, facilitator)

    click_link 'Assign Locations'
    check "Location1"

    click_button 'Update'

    expect(facilitator_locations).to have_text "Location1"

  end

  def facilitator_locations
    page.first('.locations')
  end
end
