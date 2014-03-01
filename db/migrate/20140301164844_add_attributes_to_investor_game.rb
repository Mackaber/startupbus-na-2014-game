class AddAttributesToInvestorGame < ActiveRecord::Migration
  def change
    add_column :investor_games, :start_of_game, :datetime
    add_column :investor_games, :end_of_game, :datetime
  end
end
