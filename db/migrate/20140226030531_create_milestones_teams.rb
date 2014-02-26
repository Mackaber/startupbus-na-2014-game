class CreateMilestonesTeams < ActiveRecord::Migration
  def change
    create_table :milestones_teams do |t|
      t.references :milestone, null: false
      t.references :team, null: false
    end
  end
end
