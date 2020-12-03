namespace :scheduler do
  
  desc "Busca aniversario de miembros"
  task scan_birthday: :environment do

      Member.aniversarios

  end

end
