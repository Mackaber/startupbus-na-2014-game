class AddUrlToInvestments < ActiveRecord::Migration
  def up
    add_column :investments, :url, :string
  end

  def down
    remove_column :investments, :url
  end
end
