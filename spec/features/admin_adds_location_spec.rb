require 'spec_helper'

feature 'Location creation' do
  scenario 'An admin creates a location and is shown the location' do
    admin = FactoryGirl.create( :user, username: 'admin')
    login_as(admin, scope: :user)

    visit new_location_path
    fill_in 'Name', with: 'Amboy Farm'

    click_button 'Add Location'

    expect(page).to have_text('Amboy Farm')

  end

end
