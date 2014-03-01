class AddTimestampsToMilestoneTeams < ActiveRecord::Migration
  def up
    add_column :milestone_teams, :created_at, :datetime
    add_column :milestone_teams, :updated_at, :datetime
  end

  def down
    remove_column :milestone_teams, :created_at
    remove_column :milestone_teams, :updated_at
  end
end
