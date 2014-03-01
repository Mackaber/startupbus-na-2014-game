class AddShortUrlToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :short_url, :string
  end

  def down
    remove_column :teams, :short_url
  end
end
