class AddSocialMediaImageToUser < ActiveRecord::Migration
  def change
    add_column :omniauthables, :social_media_image_url, :string
  end
end
