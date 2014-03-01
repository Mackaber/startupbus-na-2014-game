class AddIndexOnUidAndProviderToOmniauthable < ActiveRecord::Migration
  def change
    add_index :omniauthables, [:provider, :uid], unique: true
  end
end
