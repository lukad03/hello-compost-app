class InviteMailer < ActionMailer::Base
  default from: 'hello@hellocompost.com'

  def invitation(recipient)
    mail to: recipient.email, subject: 'Join #{@organization} on Hello Compost'
  end
end
