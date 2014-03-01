class AddStartDateToMilestones < ActiveRecord::Migration
  def up
    add_column :milestones, :start_at, :datetime
  end

  def down
    remove_column :milestones, :start_at
  end
end
