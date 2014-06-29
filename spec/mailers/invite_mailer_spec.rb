require 'spec_helper'

describe InviteMailer do
  describe '#send_invite' do
    it 'sends an email with the correct information' do
      organization = create(:organization)
      invite = create(:invite, organization: organization)
      mail = described_class.send_invite(invite)

      expect(mail.to).to include invite.email
      expect(mail.from).to include 'hello@hellocompost.com'
      expect(mail.subject).to eq "You're Invited to Join Hello Compost"
      expect(mail.body.encoded).to include new_organization_facilitator_path(organization.name)
    end
  end
end
