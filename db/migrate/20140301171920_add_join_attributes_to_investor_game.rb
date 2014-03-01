class AddJoinAttributesToInvestorGame < ActiveRecord::Migration
  def change
    add_column :investor_games, :team_id, :integer
    add_column :investor_games, :investor_id, :integer
    add_column :investor_games, :investment_id, :integer
    add_column :investor_games, :game_id, :integer

    remove_column :investor_games, :name, :string
    remove_column :investor_games, :start_of_game, :datetime
    remove_column :investor_games, :end_of_game, :datetime
  end
end
