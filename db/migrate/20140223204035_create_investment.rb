class CreateInvestment < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :investor
      t.references :team
      t.decimal    :amount, precision: 2

      t.timestamps
    end
  end
end
