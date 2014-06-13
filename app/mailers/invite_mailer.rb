class InviteMailer < ActionMailer::Base
  default from: 'hello@hellocompost.com'

  def deliver(recipient)
    @recipient = recipient
    @organization = Organization.find(id: recipient[:organization_id])
    mail to: @recipient.email, subject: 'Join #{@organization.name} on Hello Compost'
  end
end
