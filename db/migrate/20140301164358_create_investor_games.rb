class CreateInvestorGames < ActiveRecord::Migration
  def change
    create_table :investor_games do |t|

      t.timestamps
    end
  end
end
