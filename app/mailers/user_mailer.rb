class UserMailer < ApplicationMailer
  default :from => "fernando.flores1961@gmail.com"
  #layout "mailer"

  def test_email(users)
    @users = users
    mail to: users.map(&:email), subject: "Email de prueba"
  end
end
