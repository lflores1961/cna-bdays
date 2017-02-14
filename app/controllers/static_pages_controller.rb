class StaticPagesController < ApplicationController
  def home
    @options = [
      {:letrero => "Editar mensaje de Cumpleaños",       :ruta => "edit_mensaje_path('cumpleaños')"},
      {:letrero => "Editar mensaje de Notificación",     :ruta => "edit_mensaje_path('notificación')"},
      {:letrero => "Registros de Notarios",             :ruta => 'members_path'},
      {:letrero => "Usuarios",                          :ruta => 'users_path' }
    ]
  end

  def help
  end
end
