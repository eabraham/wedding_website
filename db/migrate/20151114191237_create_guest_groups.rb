class CreateGuestGroups < ActiveRecord::Migration
  def change
    create_table :guest_relationships do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
