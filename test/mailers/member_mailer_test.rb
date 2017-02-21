require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  test "cumple" do
    member = members(:one)
    presi = members(:three)
    mensaje = Mensaje.find_by(tipo: 'cumpleaños').texto
    mail = MemberMailer.cumple(member, presi, mensaje)
    assert_equal "¡Feliz cumpleaños!", mail.subject
    assert_equal [member.email], mail.to
    assert_equal ["noresponder@aniversarios.com"], mail.from
    assert_match "Feliz cumplea", mail.body.encoded
    assert_match "Atentamente", mail.body.encoded
    assert_match "Presidente", mail.body.encoded
  end

  test "notifica_cumple" do
    member = members(:one)
    memb2 = members(:two)
    presi = members(:three)
    mensaje = Mensaje.find_by(tipo: 'notificación').texto
    mail = MemberMailer.notifica_cumple(member, memb2, presi, mensaje)
    assert_equal "Notificación de Cumpleaños", mail.subject
    assert_equal [memb2.email], mail.to
    assert_equal ["noresponder@aniversarios.com"], mail.from
    assert_match "Notificaci", mail.body.encoded
  end

end
