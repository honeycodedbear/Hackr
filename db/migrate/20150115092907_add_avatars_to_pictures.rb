class AddAvatarsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :image, :string
    add_column :pictures, :user_id, :integer
  end
end
