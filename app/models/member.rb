class Member < ApplicationRecord
  default_scope -> { order(:numero) }
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 69 }, format: { with: VALID_EMAIL_REGEX }
  acts_as_birthday :fechaNacimiento


  def self.cumplen
    miembros = Member.all
    @cumpleaneros = []
    Time::DATE_FORMATS[:d_and_m] = '%d %b'
    fecha_hoy = Time.now.to_formatted_s(:d_and_m)
    miembros.each do |miembro|
      if miembro.fechaNacimiento.to_formatted_s(:short) == fecha_hoy
        @cumpleaneros << miembro
      end
    end
    return @cumpleaneros
  end

  # Do the birthay notifications
  def self.aniversarios
    cumpleas = Member.cumplen
    if cumpleas.any?
      members = Member.all
      admin = User.first
      presi = Member.find_by(presidente: true)
      notiMSG = Mensaje.find_by(tipo: 'notificación').texto
      cumpMSG = Mensaje.find_by(tipo: 'cumpleaños').texto
      cumpleas.each do |cumplea|
        MemberMailer.cumple(cumplea, presi, cumpMSG).deliver_now
        notifica = members.select { |item| item != cumplea }
        notifica.each do |noti|
          MemberMailer.notifica_cumple(cumplea, noti, presi, notiMSG).deliver_now
        end
        MemberMailer.notifica_cumple(cumplea, admin, presi, notiMSG).deliver_now
      end
    end

  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      member = find_by_id(row["id"]) || new
      member.attributes = row.to_hash
      member.save!
    end
  end

  private

    # Converts email to lowercase
    def downcase_email
      email.downcase!
    end
end
