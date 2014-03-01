class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string     :name
      t.datetime   :start_of_game
      t.datetime   :end_of_game
      t.text       :description

      t.timestamps
    end
  end
end
