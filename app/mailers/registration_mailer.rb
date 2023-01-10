class RegistrationMailer < ApplicationMailer
  default from: "test24mailer@gmail.com"
  def registration_email(user)
    @user = user
    mail(
      from: "test24mailer@gmail.com",
      to: @user.email,
      subject: 'registration sucessful on bus reservation '
      )
  end
end
