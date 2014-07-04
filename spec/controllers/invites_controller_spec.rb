require 'spec_helper'

describe InvitesController do

  describe 'mail_invite' do
    it 'sends an email notification' do
      invite = InvitesController.new
      new_invite = Invite.new(invite_params)

      expect { invite.instance_eval{ mail_invite(new_invite) } }.
        to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  def invite_params
    { email: 'invited_facilitator@example.com', organization: organization }
  end

  def organization
    @organization ||= create(:organization)
  end

end
