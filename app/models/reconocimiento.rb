class Reconocimiento < ApplicationRecord
  belongs_to :member
  default_scope { order('servicio_reconocido ASC') }
end
