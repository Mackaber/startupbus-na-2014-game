class AddClicksToInvestment < ActiveRecord::Migration
  def up
    add_column :investments, :clicks, :integer
  end

  def down
    remove_column :investments, :clicks
  end
end
