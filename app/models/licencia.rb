class Licencia < ApplicationRecord
  belongs_to :member
  validate :date_ordinality
  default_scope { order('inicio ASC') }
  # Ex:- scope :active, -> {where(:active => true)}

  def date_ordinality
    errors.add(:final, ": La fecha de inicio del período de Licencia no puede ser posterior a la fecha de término del período. Verifique por favor.") unless inicio < final
  end
  
end

