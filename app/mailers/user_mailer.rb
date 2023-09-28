class UserMailer < ApplicationMailer

  def welcome_email(procedure)
    @user = procedure.user
    mail(to: @user.email, subject: 'Welcome to FandNext')
  end
end
