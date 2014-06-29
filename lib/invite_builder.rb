class InviteBuilder
  def initialize(attributes = {})
    @invite = Invite.new(attributes)
    if @invite.save
      if mail_invite(attributes)
        return true
      end
    end
  end

  def mail_invite(invite)
    InviteMailer.send_invite(invite).deliver
  end

end
