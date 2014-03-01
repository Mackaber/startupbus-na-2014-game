class AddNameToInvestorGame < ActiveRecord::Migration
  def change
    add_column :investor_games, :name, :string
  end
end
