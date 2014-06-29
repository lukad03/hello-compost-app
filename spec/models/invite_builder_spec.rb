require 'spec_helper'

describe InviteBuilder do
  describe 'mail_invite' do
    it 'sends an email notification' do
      builder = described_class.new(invite_params)

      expect { builder.mail_invite(invite_params) }.
        to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  def invite_params
    { email: 'invited_facilitator@example.com', organization_id: organization }
  end

  def organization
    @organization ||= create(:organization)
  end
end
