class CreateTeamMessages < ActiveRecord::Migration
  def change
    create_table :team_messages do |t|
      t.integer  :message_id
      t.integer  :team_id
      t.timestamps
    end
  end
end
