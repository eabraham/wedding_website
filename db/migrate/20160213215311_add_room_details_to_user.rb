class AddRoomDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :room_detail, :text
  end
end
