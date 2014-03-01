class RemoveAttachableFromOmniauthable < ActiveRecord::Migration
  def up
    remove_column :omniauthables, :attachable_type, :string
    remove_column :omniauthables, :attachable_id, :integer
  end

  def down
    add_column :omniauthables, :attachable_type, :string
    add_column :omniauthables, :attachable_id, :integer
  end
end
