class AddColumnsToOmniauthable < ActiveRecord::Migration
  def change
    add_column :omniauthables, :bus_id, :integer
    add_column :omniauthables, :description, :text
    add_column :omniauthables, :blog, :string
    add_column :omniauthables, :facebook, :string
    add_column :omniauthables, :foursquare, :string
    add_column :omniauthables, :github, :string
    add_column :omniauthables, :linkedin, :string
    add_column :omniauthables, :twitter, :string
    add_column :omniauthables, :website, :string

    add_index :omniauthables, [:bus_id]
  end
end
