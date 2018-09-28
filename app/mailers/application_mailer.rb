class ApplicationMailer < ActionMailer::Base
  # default from: '' -- in mailer config
  layout 'mailer'

  def welcome_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Vertical Tango: Thank you for your inquiry!')
  end
end
