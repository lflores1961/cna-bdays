namespace :scheduler do
  
  desc "Busca aniversario de miembros"
  task scan_birthday: :environment do
    puts '***********************'
    puts 'Ejecutando task: scan_birthday@scheduler'
    puts 'Buscando cumpleaños'
    Member.aniversarios
    puts 'Tarea terminada'
    puts 'Saliendo'
  end

end
