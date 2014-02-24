class AddOmniauthToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :provider, :string
    add_column :investors, :uid, :string
  end
end
