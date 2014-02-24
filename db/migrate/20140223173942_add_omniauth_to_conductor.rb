class AddOmniauthToConductor < ActiveRecord::Migration
  def change
    add_column :conductors, :provider, :string
    add_column :conductors, :uid, :string
  end
end
