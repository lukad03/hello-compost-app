require "spec_helper"

feature 'Scrap creation' do

  pending 'User logs in and adds scraps' do
    facilitator = FactoryGirl.create( :user, username: 'lukad03' )
    client = FactoryGirl.create( :user, username: 'resident' )
    login_as(facilitator, scope: :user)

    visit new_scrap_path
    fill_in 'scrap_weight', with: '2.27'
    select 'resident', from: 'scrap_user_id'

    click_button 'Create Scrap'

    expect(page).to have_text('resident')
    expect(page).to have_text('2.27')

    visit '/users/resident'
    expect(page).to have_text('resident')
    expect(page).to have_text('2 Credits')

  end

end
