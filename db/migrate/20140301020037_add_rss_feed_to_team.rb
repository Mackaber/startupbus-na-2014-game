class AddRssFeedToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :rss_feed, :string
  end

  def down
    remove_column :teams, :rss_feed
  end
end
