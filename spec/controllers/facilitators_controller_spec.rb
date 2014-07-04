require 'spec_helper'

describe FacilitatorsController do

  describe '#create' do
    context 'when an invite does not exist' do
      it 'returns an error when an invite does not exist' do
        email = "invited_facilitator@example.com"
        organization = create(:organization, name: "Organization")

        facilitator = post :create, organization_name: organization.name,
                      facilitator: facilitator_params(email)

        expect{ facilitator }.to_not change{ Facilitator.count }.by(1)
      end
    end

    context 'when an invite does exist' do
      pending 'updates the redeemed_at attributes of the invite' do
        email = "invited_facilitator@example.com"
        invite = create(:invite, email: "invited_facilitator@example.com")
        organization = create(:organization, name: "Organization")

        facilitator = post :create, organization_name: organization.name,
                      facilitator: facilitator_params(email)

        expect{ facilitator }.to change(invite.redeemed_at)
      end
    end

    def facilitator_params(email)
      { name: 'Name', user_attributes: { email: email, password: 'password' } }
    end

  end
end
