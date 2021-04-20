# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview all emails at http://localhost:3000/rails/mailers/user_mailer/test_email
  def test_email
    users = User.all
    UserMailer.test_email(users)
  end
end
