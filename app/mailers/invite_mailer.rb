class InviteMailer < ActionMailer::Base
  default from: 'hello@hellocompost.com'

  def send_invite(invite)
    @invite = invite
    @organization = Organization.where(id: @invite[:organization_id]).first
    mail to: @invite[:email], subject: "You're Invited to Join Hello Compost"
  end
end
