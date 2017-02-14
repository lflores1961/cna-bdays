class Member < ApplicationRecord
  acts_as_birthday :fechaNacimiento

  def self.cumplen
    miembros = Member.all
    cumpleaneros = []
    Time::DATE_FORMATS[:d_and_m] = '%d %b'
    fecha_hoy = Time.now.to_formatted_s(:d_and_m)
    miembros.each do |miembro|
      if miembro.fechaNacimiento.to_formatted_s(:short) == fecha_hoy
        cumpleaneros << miembro
      end
    end
    return cumpleaneros
  end

  # Do the birthay notifications
  def self.aniversarios
    @cumpleas = Member.cumplen
    if @cumpleas.any?
      @members = Member.all
      @cumpleas.each do |cumplea|
        UserMailer.cumple(cumplea)
        notifica = @members - cumplea
        notifica.each do |noti|
          UserMailer.notifica_cumple(cumplea, noti)
        end
      end
    end

  end
end
