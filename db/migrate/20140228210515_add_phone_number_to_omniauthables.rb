class AddPhoneNumberToOmniauthables < ActiveRecord::Migration
  def up
    add_column :omniauthables, :phone_number, :string
  end

  def down
    remove_column :omniauthables, :phone_number
  end
end
