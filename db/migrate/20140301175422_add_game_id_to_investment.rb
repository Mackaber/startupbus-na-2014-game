class AddGameIdToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :game_id, :integer
  end
end
