# Preview all emails at http://localhost:3000/rails/mailers/application_mailer
class ApplicationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/application_mailer/welcome_email
  def welcome_email
    ApplicationMailer.welcome_email
  end

end
