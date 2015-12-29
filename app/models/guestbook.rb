class Guestbook < ActiveRecord::Base
  belongs_to :user

  validates :from, presence: true
  validates :body, presence: true

end
