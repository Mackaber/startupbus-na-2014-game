class AddClicksToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :clicks, :integer
  end

  def down
    remove_column :teams, :clicks
  end
end
