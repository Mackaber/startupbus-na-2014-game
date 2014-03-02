class CreateTeamUpdates < ActiveRecord::Migration
  def change
    create_table :team_updates do |t|
      t.integer :team_id
      t.string  :subject
      t.text    :body
      t.timestamps
    end
  end
end
