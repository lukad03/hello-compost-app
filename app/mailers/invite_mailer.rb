class InviteMailer < ActionMailer::Base
  default from: 'hello@hellocompost.com'

  def send_invite(invite)
    @invite = invite
    @organization = Organization.find(@invite[:organization_id].to_i)
    mail to: @invite[:email], subject: "You're Invited to Join Hello Compost"
  end
end
