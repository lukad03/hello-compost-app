class Mailer < ActionMailer::Base
  default from: 'hello@hellocompost.com'

  def invitation(recipient)
    @organization = recipient.organization.name
    mail to: recipient.email, subject: 'Join #{@organization} on Hello Compost'
  end
end
