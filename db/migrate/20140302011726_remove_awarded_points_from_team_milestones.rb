class RemoveAwardedPointsFromTeamMilestones < ActiveRecord::Migration
  def down
    add_column :milestone_teams, :awarded_points, :integer
  end

  def up
    remove_column :milestone_teams, :awarded_points
  end
end
