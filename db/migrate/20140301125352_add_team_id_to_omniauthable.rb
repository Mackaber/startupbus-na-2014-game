class AddTeamIdToOmniauthable < ActiveRecord::Migration
  def change
    add_column :omniauthables, :team_id, :integer
    add_index :omniauthables, [:team_id]
  end
end
