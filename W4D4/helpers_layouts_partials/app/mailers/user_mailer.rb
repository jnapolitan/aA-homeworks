class UserMailer < ApplicationMailer
  default from: 'info@99cats.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://99cats.com/session/new'
    mail(to: 'fake@fake.com', subject: 'Welcome to 99 Cats!')
  end
end
