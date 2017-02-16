class MemberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.cumple.subject
  #
  def cumple(miembro)
    @miembro = miembro
    @presi = Member.find_by(presidente: true)
    @mensaje = Mensaje.find_by(tipo: 'cumpleaños')
    mail to: miembro.email, subject: "¡Feliz cumpleaños!"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.notifica_cumple.subject
  #
  def notifica_cumple(cumple, miembro)
    @cumple = cumple
    @miembro = miembro
    @mensaje = Mensaje.find_by(tipo: 'notificación')
    mail to: miembro.email, subject: "Notificación de Cumpleaños"

  end
end
