namespace :fix_sqlite do
  desc "Fix sqlite3 boolean serialization to handle 1 and 0"
  task fix_bools: :environment do
    Member.where("presidente = 't'").update_all(presidente: 1)
    Member.where("presidente = 'f'").update_all(presidente: 0)
  end

end
