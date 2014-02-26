class AddAwardedPointsToMilestoneTeam < ActiveRecord::Migration
  def change
    add_column :milestone_teams, :awarded_points, :integer
  end
end
