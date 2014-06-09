require 'spec_helper'

feature 'Invite Creation' do
  scenario 'Admin invites a facilitator' do
    organization = create(:organization)
    location = create(:location, organization_id: organization.id, name: 'Location')
    admin = create(:admin, organization_id: organization.id)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)

    login_as(user, scope: :user)

    visit new_organization_invite_path(organization.name)

    fill_in 'Email', with: 'user@user.com'
    check 'Location'

    click_button 'Send Invite'


  end


end
