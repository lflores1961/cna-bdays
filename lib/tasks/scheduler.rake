namespace :scheduler do
  
  desc "Busca aniversario de miembros"
  task scan_birthday: :environment do

      puts "****************************************"
      puts "Buscando ...."
      Member.aniversarios
      puts "Terminando..."

  end

end
