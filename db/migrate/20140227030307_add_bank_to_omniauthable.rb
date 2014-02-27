class AddBankToOmniauthable < ActiveRecord::Migration
  def change
    add_column :omniauthables, :bank, :decimal, precision: 2, scale: 0, default: 0
  end
end
