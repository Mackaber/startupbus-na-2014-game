class AddDescriptionToTeamMilestone < ActiveRecord::Migration
  def up
    add_column :milestone_teams, :url, :string
    add_column :milestone_teams, :description, :text
  end

  def down
    remove_column :milestone_teams, :url
    remove_column :milestone_teams, :description
  end
end
