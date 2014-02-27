class RenameMilestoneTeamTable < ActiveRecord::Migration
  def change
    rename_table :milestones_teams, :milestone_teams
  end
end
