class AddTeamStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :team_status, :string
  end
end
