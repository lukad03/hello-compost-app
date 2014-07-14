require 'spec_helper'

feature 'Redeem Credits' do
  context 'when a client has enough credits' do
    scenario 'Facilitator redeems credits for client' do
      facilitator_setup
      client = create(:client, username: 'resident', organization: organization)
      credit = create(:credit, value: '1000', client_id: client.id)

      visit client_path(client)

      expect(page).to have_text '1000 Credits'
      click_link 'Redeem Credits'

      fill_in 'debit_value', with: '900'
      click_button 'Redeem'

      expect(page).to have_text 'Credits Redeemed!'
      expect(page).to have_text '100/1000 Credits'
    end
  end

  def organization
    organization = FactoryGirl.create(:organization, name: 'Cheerio')
  end

  def facilitator_setup
    facilitator = FactoryGirl.create( :facilitator, organization: organization )
    user = FactoryGirl.create( :user, rolable_type: 'Facilitator', rolable_id: facilitator.id )

    login_as(user)
  end
end


