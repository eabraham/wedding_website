class AddOtherRsvpToUser < ActiveRecord::Migration
  def change
    add_column :users, :brunch_rsvp, :boolean
    add_column :users, :tour_rsvp, :boolean
    add_column :users, :dinner_rsvp, :boolean
    add_column :users, :hotel_friday, :boolean
    add_column :users, :hotel_saturday, :boolean
    add_column :users, :hotel_sunday, :boolean
  end
end
