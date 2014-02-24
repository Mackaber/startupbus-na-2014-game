class RemoveConductorFromBus < ActiveRecord::Migration
  def up
    remove_column :buses, :conductor_id
  end

  def down
    add_column :buses, :conductor_id, :integer
  end
end
