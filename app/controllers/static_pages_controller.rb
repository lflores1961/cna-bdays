class StaticPagesController < ApplicationController
  def home
    @options = [
      {:letrero => "Editar correo de Cumpleaños",       :ruta => '#'},
      {:letrero => "Editar correo de Notificación",      :ruta => '#'},
      {:letrero => "Registros de Notarios",                    :ruta => '#'},
      {:letrero => "Usuarios",                                              :ruta => '#'}
    ]
  end

  def help
  end
end
