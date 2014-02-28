class AddImportedToOmniauthable < ActiveRecord::Migration
  def up
    add_column :omniauthables, :imported, :bool
  end

  def down
    remove_column :omniauthables, :imported
  end
end
