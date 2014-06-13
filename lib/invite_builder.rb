class InviteBuilder
  def initialize(invite)
    new_invite(invite)
    if new_invite
     mail_invite(invite)
      if mail_invite
        return true
      end
    end
  end

  def new_invite(invite)
    binding.pry
    @invite = Invite.create(email: invite[:email],
                            organization_id: invite[:organization_id],
                            location_ids: invite[:location_ids])
  end

  def mail_invite(invite)
    Mailer.deliver(invite)
  end

  def save
    invite.save && InviteMailer.send_invite(invite).deliver
  end
end
