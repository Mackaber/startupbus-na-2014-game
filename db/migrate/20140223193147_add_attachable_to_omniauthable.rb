class AddAttachableToOmniauthable < ActiveRecord::Migration
  def change
    add_column :omniauthables, :attachable_type, :string
    add_column :omniauthables, :attachable_id, :integer
  end
end
