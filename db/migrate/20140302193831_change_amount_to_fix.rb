class ChangeAmountToFix < ActiveRecord::Migration
  def change
    change_column :investments, :amount, :integer
  end
end
