class CreateGuestbooks < ActiveRecord::Migration
  def change
    create_table :guestbooks do |t|
      t.string :from
      t.string :body
      t.integer :poster_id

      t.timestamps
    end
  end
end
