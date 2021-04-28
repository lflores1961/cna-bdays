class MemberMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.cumple.subject
  #
  def cumple(miembro, presi, mensaje, copiar)
    @miembro = miembro
    @presi = presi
    @mensaje = mensaje
    mail to: miembro.email, cc: copiar, subject: "¡Feliz cumpleaños!"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.notifica_cumple.subject
  #
  def notifica_cumple(cumple, miembro, presi, mensaje)
    @cumple = cumple
    @miembro = miembro
    @presi = presi
    @mensaje = mensaje
    mail to: miembro.email, subject: "Notificación de Cumpleaños"

  end

end
