require 'spec_helper'

feature 'Add Credits' do
  scenario 'Admin adds credits for a client' do
    organization = create( :organization, name: 'Cheeroio' )
    client = create( :client, username: 'resident',
                                          organization: organization )
    admin_login(organization)
    visit admin_dashboard_path

    click_link 'Manage Clients'
    click_link 'Add Credits'

    fill_in 'Add Credits', with: '1000'
    click_button 'Add Credits'

    expect(page).to have_text '1000 Credits'

  end

  def admin_login(organization)
    admin = create(:admin, organization: organization)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin.id)

    login_as(user)
  end

end
