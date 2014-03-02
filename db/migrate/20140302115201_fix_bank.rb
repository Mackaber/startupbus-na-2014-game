class FixBank < ActiveRecord::Migration
  def change
    change_column :omniauthables, :bank, :integer
  end
end
