class CreateMensajes < ActiveRecord::Migration[5.0]
  def change
    create_table :mensajes do |t|
      t.string :tipo
      t.text :texto

      t.timestamps
    end
  end
end
