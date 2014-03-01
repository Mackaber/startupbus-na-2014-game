class AddImportedToOmniauthable < ActiveRecord::Migration
  def up
    add_column :omniauthables, :imported, :boolean
  end

  def down
    remove_column :omniauthables, :imported
  end
end
