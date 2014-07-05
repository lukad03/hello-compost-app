require 'spec_helper'

describe FacilitatorsController do

  describe '#create' do
    it 'returns an error when an invite does not exist' do

      organization = create(:organization, name: "Organization")

      expect{
      post :create, organization_name: organization.name,
                    facilitator: attributes_for(:facilitator, user_attributes: { email: "email@email.com"} )
      }.to_not change(Facilitator,:count)
    end

    it 'is successful when an invite does exist' do
      organization = create(:organization, name: "Organization")
      invite = create(:invite, email: "email@email.com")

      facilitator = post :create, organization_name: organization.name,
                    facilitator: attributes_for(:facilitator,
                    user_attributes: { email: "email@email.com"} )


      expect{facilitator}.to change { Facilitator.count }.by(1)
    end

    it 'redeems invite when saved' do
      organization = create(:organization, name: "Organization")
      invite = create(:invite, email: "email@email.com")

      expect{
      post :create, organization_name: organization.name,
                    facilitator: attributes_for(:facilitator, user_attributes: { email: "email@email.com"} )
      }.to change(invite, :redeemed_at)
    end

  end
end
