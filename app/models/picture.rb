class Picture < ActiveRecord::Base
  mount_uploader :picture, PicturesUploader
  belongs_to :user
end
