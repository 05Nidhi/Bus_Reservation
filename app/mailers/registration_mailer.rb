class RegistrationMailer < ApplicationMailer
  default from: "test24mailer@gmail.com"
  def registration_email(user)
    @user = params[:user]
    mail(to: @user.email,subject:"Registration sucessfull")
  end
end
