class Member < ApplicationRecord
  default_scope -> { order(:numero) }
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 69 }, format: { with: VALID_EMAIL_REGEX }
  validate :only_one_president_allowed
  has_many :licencias
  has_many :reconocimientos
  # acts_as_birthday :fechaNacimiento

  # validates :numero, uniqueness: 
  # { message: -> (object, data) do 
  #                      ": El número de Notaría #{data[:value]} ya existe. Verifique por favor"
  #                     end
  # }
  # validates :presidente, uniqueness: 
  # { message: -> (object, data) do 
  #                      ": Solamente puede haber un presidente. Verifique por favor"
  #                     end
  # }

  def only_one_president_allowed
    conteo = Member.where(presidente: true).count
    puts "*** Número de presidentes actual: #{conteo}"
    puts "===== Nombre: #{nombre} --> Presidente: #{presidente}"
    if conteo == 1 && presidente
      errors.add(:presidente, ": Solamente puede haber un presidente. Verifique por favor")
    end
    
  end

  def total_service_time
    end_time = revocacion_fiat || Date.today
    return (((end_time - inicio_ejercicio) - licence_time).to_i) / 365
  end

  def self.cumplen
    miembros = Member.all
    @cumpleaneros = []
    
    # Next block is an example of WHAT DOESN'T WORK
    #  Gem 'birthday' just doesn't work
    # Member.find_birthdays_for(Date.today)
    #        or
    # miembros.each do |miembro|
    #   @cumpleaneros << miembro if  miembro.birthday_today? 
    # end
    # Next code is what did work on version 1
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

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |member|
        csv << member.attributes.values_at(*column_names)
      end
    end
  end

  private

    # Converts email to lowercase
    def downcase_email
      email.downcase!
    end

    def licence_time
      total_time = 0
      self.licencias.each do |l|
        total_time += (l.final - l.inicio).to_i
      end
      return total_time
    end
end
