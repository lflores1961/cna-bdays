namespace :programar do

  desc "Busca aniversario de miembros"
  task busca_cumple: :environment do
    puts "****************************************"
    puts "Buscando ...."
    Member.aniversarios
    puts "Saliendo..."
  end

end
