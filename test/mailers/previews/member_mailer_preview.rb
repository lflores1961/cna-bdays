# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/cumple
  def cumple
    member = Member.first
    presi = Member.find_by(presidente: true)
    mensaje = Mensaje.find_by(tipo: 'cumpleaños').texto
    MemberMailer.cumple(member, presi, mensaje)

  end

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/notifica_cumple
  def notifica_cumple
    miembro = Member.find(2)
    cumple = Member.find(1)
    presi = Member.find_by(presidente: true)
    mensaje = Mensaje.find_by(tipo: 'notificación').texto
    MemberMailer.notifica_cumple(cumple, miembro, presi, mensaje)

  end

end
