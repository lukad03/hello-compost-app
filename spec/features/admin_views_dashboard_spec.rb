require 'spec_helper'

feature 'Admin Dashboard' do

  scenario 'admin logs in to view dashboard' do
    admin_setup

    visit admin_dashboard_path
    expect(page).to have_text 'Scraps Collected'
  end

  def admin_setup
    organization = create(:organization, name: 'Cheeroio')
    admin = create(:admin, organization_id: organization.id)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)
    client = create(:client, :with_scraps, organization_id: organization.id)

    login_as(user)
  end

end
