class AddLogoUrlToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :logo_url, :string
  end

  def down
    remove_column :teams, :logo_url
  end
end
