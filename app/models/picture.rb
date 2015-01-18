class Picture < ActiveRecord::Base
  mount_uploader :picture, PicturesUploader
  belongs_to :user
  #resizes....dynamic or saved alternatives
end
