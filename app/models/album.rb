class Album < ActiveRecord::Base
  has_many :images
  has_many :imageables, through: :images
end
