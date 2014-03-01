class AddApproveByToMilestoneRequests < ActiveRecord::Migration
  def up
    add_column :milestone_teams, :approved_by, :integer
  end

  def down
    remove_column :milestone_teams, :approved_by
  end
end
