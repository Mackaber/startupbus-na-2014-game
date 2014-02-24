class CreateMilestone < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string   :name, null: false
      t.text     :description
      t.integer  :max_points, default: 0
      t.datetime :target_completion_date
      t.text     :validation_instructions
      t.text     :public_instructions

      t.timestamps
    end

    add_index :milestones, [:name]
    add_index :milestones, [:target_completion_date]
  end
end
