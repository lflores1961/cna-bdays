class UserMailer < ApplicationMailer

  def test_email(users)
    @users = users
    mail to: users.map(&:email), subject: "Email de prueba"
  end
end
