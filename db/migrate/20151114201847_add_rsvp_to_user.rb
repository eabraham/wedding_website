class AddRsvpToUser < ActiveRecord::Migration
  def change
    add_column :users, :rsvp, :boolean
  end
end
