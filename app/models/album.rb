class Album < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :imageables, through: :images
end
