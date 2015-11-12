class WeddingPartyMember < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :imageables, through: :images

  validates :name, presence: true
  validates :bio, presence: true
  validates :party_order, uniqueness: { scope: :bride_side }

  scope :alernating_party, -> { order("party_order asc, bride_side desc") }
end
