require 'spec_helper'

feature 'Admin Dashboard' do

  scenario 'admin logs in to view dashboard' do
    admin_setup

    visit admin_dashboard_path
    expect(page).to have_text 'Waste Collected'
  end

  def admin_setup
    organization = FactoryGirl.create(:organization, name: 'Cheeroio')
    admin = FactoryGirl.create(:admin, organization_id: organization.id)
    user = FactoryGirl.create(:user, rolable_type: 'Admin', rolable_id: admin.id)
    client = FactoryGirl.create(:client, username: 'resident', organization_id: organization.id)
    login_as(user)
  end

end
