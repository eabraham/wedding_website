class RemoveImageIdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :image_id, :integer
  end
end
