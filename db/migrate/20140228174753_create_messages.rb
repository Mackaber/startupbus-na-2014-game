class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string   :subject
      t.string   :type
      t.text     :body
      t.integer  :conductor_id
      t.integer  :sent
      t.timestamps
    end
  end
end
