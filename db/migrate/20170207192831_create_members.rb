class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.integer :numero
      t.string :nombre
      t.string :email
      t.date :fechaNacimiento
      t.boolean :presidente

      t.timestamps
    end
  end
end
