class CreateReconocimientos < ActiveRecord::Migration[5.2]
  def change
    create_table :reconocimientos do |t|
      t.date :reconocimiento
      t.integer :servicio_reconocido
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
