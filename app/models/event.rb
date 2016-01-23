class Event < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :imageables, through: :images

  accepts_nested_attributes_for :images, allow_destroy: true

  VALID_EVENT_ICONS = ['picture', 'location', 'movie', 'plane', 'diamond', 'heart', 'menu', 'home']

  validate :date_start, :presence
  validate :date_end, :presence

  def format_event_date
    if (date_end - date_start) / 60 < 1
      # no time range
      date_start.strftime("%B %e, %Y")
   	elsif date_end.strftime('%j').to_i == date_start.strftime('%j').to_i 
      # time range same day
      s = date_start.strftime("%B %e, %Y")
      e = date_end.strftime("%l:%M %p")
      "#{s} - #{e}"
    else
      # time range different day
      s = date_start.strftime("%B %e, %Y")
      e = date_end.strftime("%B %e, %Y")
      "#{s} - #{e}"
   	end
  end
end
