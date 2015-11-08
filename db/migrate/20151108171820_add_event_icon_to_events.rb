class AddEventIconToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_icon, :string
  end
end
