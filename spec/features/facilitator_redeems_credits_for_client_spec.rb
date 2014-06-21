require 'spec_helper'

feature 'Redeem Credits' do
  context 'when client has enough credits' do
    scenario 'Facilitator redeems credits for client' do
      facilitator_setup
      client = FactoryGirl.create(:client, username: 'resident', organization: organization)
      credit = FactoryGirl.create(:credit, value: '10', client_id: client.id)

      visit client_path(client)

      expect(page).to have_text '10 Credits'
      click_link 'Redeem Credits'

      fill_in 'debit_value', with: '1'
      click_button 'Redeem'

      expect(page).to have_text 'Credits Redeemed!'
      expect(page).to have_text '0 Credits'
    end
  end

  def organization
    organization = FactoryGirl.create(:organization, name: 'Cheerio')
  end

  def facilitator_setup
    facilitator = FactoryGirl.create( :admin, organization: organization )
    user = FactoryGirl.create( :user, rolable_type: 'Admin', rolable_id: facilitator.id )

    login_as(user)
  end
end


