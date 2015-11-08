class Image < ActiveRecord::Base
  mount_uploader :photo, ImageUploader

  belongs_to :imageable, polymorphic: true
end
