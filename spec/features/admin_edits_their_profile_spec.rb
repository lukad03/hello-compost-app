require 'spec_helper'

feature 'Admin Profile' do
  scenario 'Admin edits their name and user information' do
    admin_login
    visit admin_dashboard_path

    click_link 'Admin Name'

    fill_in 'Name', with: 'New New Name'
    fill_in 'admin_user_attributes_email', with: 'new-email@email.com'
    fill_in 'admin_user_attributes_password', with: 'new-password1'

    click_button 'Update Profile'

    expect(page).to have_text 'New New Name'
  end

  scenario 'Admin edits their name without user information' do
    admin_login
    visit admin_dashboard_path

    click_link 'Admin Name'

    fill_in 'Name', with: 'New New Name'

    click_button 'Update Profile'

    expect(page).to have_text 'New New Name'
  end

  def admin_login
    organization = create(:organization)
    admin = create(:admin, organization: organization, name: 'Admin Name')
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)

    login_as(user)
  end
end
