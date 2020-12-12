class CreateLicencias < ActiveRecord::Migration[5.2]
  def change
    create_table :licencias do |t|
      t.date :inicio
      t.date :final
      t.integer :secuencia
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
