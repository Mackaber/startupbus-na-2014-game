class RenameMessageTypeToDeliveryMethod < ActiveRecord::Migration
  def up
    remove_column :messages, :type
    add_column :messages, :delivery_method, :string
  end

  def down
    remove_column :messages, :delivery_method
    add_column :messages, :type, :string
  end
end