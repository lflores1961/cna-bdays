class AddDatesToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :fiat_supernumerario, :date
    add_column :members, :fiat_notario_titular, :date
    add_column :members, :asamblea_aceptacion, :date
    add_column :members, :inicio_ejercicio, :date
    add_column :members, :revocacion_fiat, :date
    add_column :members, :motivo_revocacion, :string
  end
end
