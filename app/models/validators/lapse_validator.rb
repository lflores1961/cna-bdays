# class LapseValidator < ActiveModel::Validator
class Validators::LapseValidator < ActiveModel::Validator

  def validate(record)
    licencias_activas = get_licences_array(record.member_id)

    if licencias_activas.any?
      lapse = { :inicio => record.inicio, :final => record.final }
    
      error_found = lapse_validation(lapse, licencias_activas)
    
      record.errors[:base] << "El rango registrado se superpone con alguno de los períodos de licencia ya registrados. Verifique y corrija por favor." unless error_found == 0

    end
            
  end
  
  private
  
    def get_licences_array(miembro)
      arreglo = []
      notario = Member.find(miembro)
      if notario.licencias.any?
        notario.licencias.each do|licencia|
          arreglo << { :inicio => licencia.inicio, :final => licencia.final }
        end
        
      end
      return arreglo
    end
  
    def lapse_validation(lapse, licencias)
      found_error = 0
      licencias.each do |span|
        unless (lapse[:final] < span[:inicio] || lapse[:inicio] > span[:final])
          found_error = 1
          # errors.add(:final, ": El rango registrado se superpone con alguna de los períodos de licencia ya registrados. Verifique y corrija por favor.")
          break
        end
      end
      return found_error
    end
  
  
end