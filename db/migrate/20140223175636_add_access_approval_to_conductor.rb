class AddAccessApprovalToConductor < ActiveRecord::Migration
  def change
    add_column :conductors, :approved_at, :datetime
  end
end
