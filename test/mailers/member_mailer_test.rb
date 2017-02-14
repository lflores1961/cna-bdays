require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  test "cumple" do
    member = members(:one)
    mail = MemberMailer.cumple(member)
    assert_equal "¡Feliz cumpleaños!", mail.subject
    assert_equal [member.email], mail.to
    assert_equal ["noresponder@aniversarios.com"], mail.from
    assert_match "Feliz cumplea", mail.body.encoded
  end

  test "notifica_cumple" do
    member = members(:one)
    memb2 = members(:two)
    mail = MemberMailer.notifica_cumple(member, memb2)
    assert_equal "Notificación de Cumpleaños", mail.subject
    assert_equal [memb2.email], mail.to
    assert_equal ["noresponder@aniversarios.com"], mail.from
    assert_match "Notificaci", mail.body.encoded
  end

end
