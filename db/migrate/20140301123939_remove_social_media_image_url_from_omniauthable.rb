class RemoveSocialMediaImageUrlFromOmniauthable < ActiveRecord::Migration
  def up
    remove_column :omniauthables, :social_media_image_url
  end

  def down
    add_column :omniauthables, :social_media_image_url, :string
  end
end
