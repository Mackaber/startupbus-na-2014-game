class CreateInvestorTeamUpdates < ActiveRecord::Migration
  def change
    create_table :investor_team_updates do |t|
      t.integer :team_update_id
      t.integer :investor_id

      t.timestamps
    end
  end
end
