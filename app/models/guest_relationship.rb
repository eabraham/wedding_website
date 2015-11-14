class GuestRelationship < ActiveRecord::Base
  belongs_to :parent, class_name: "User", foreign_key: "parent_id", primary_key: :parent_id
  belongs_to :child, class_name: "User", foreign_key: "child_id", primary_key: :child_id

  validate :parent_id, presence: true
  validate :child_id, presence: true
end
