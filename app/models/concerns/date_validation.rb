module DateValidation
  def lapse_validation(lapse, licencias_activas)
    licencias_activas.each do |span|
      unless (lapse[:final] < span[:inicio] || lapse[:inicio] > span[:final])
        error = 1
        errors.add(:final, ": El rango registrado se superpone con alguna de los períodos de licencia ya registrados. Verifique y corrija por favor.")
        break
      end
    end
  end
end

