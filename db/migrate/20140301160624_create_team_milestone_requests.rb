class CreateTeamMilestoneRequests < ActiveRecord::Migration
  def change
    create_table :team_milestone_requests do |t|
      t.integer :milestone_id
      t.integer :team_id
      t.string  :url
      t.text    :description
      t.timestamps
    end
  end
end
