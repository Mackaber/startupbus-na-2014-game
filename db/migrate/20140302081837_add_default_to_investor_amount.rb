class AddDefaultToInvestorAmount < ActiveRecord::Migration
  def change
    change_column :omniauthables, :bank, :decimal, precision: 2, scale: 0, default: 1000
  end
end
