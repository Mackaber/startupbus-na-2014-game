class AddImageUrlToBuses < ActiveRecord::Migration
  def up
    add_column :buses, :image_url, :string
  end

  def down
    remove_column :buses, :image_url
  end
end
