class CreateWeddingPartyMembers < ActiveRecord::Migration
  def change
    create_table :wedding_party_members do |t|
      t.string :name
      t.string :bio
      t.boolean :bride_side
      t.integer :party_order

      t.timestamps
    end
  end
end
