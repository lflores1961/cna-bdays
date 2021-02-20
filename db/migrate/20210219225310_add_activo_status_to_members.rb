class AddActivoStatusToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :status, :integer, default: 1
  end
end
