class AddAccessApprovalToUser < ActiveRecord::Migration
  def change
    add_column :users, :approved_at, :datetime
    add_column :users, :approved_by, :integer
  end
end
