class AddTitleToWeddingParty < ActiveRecord::Migration
  def change
    add_column :wedding_party_members, :title, :string
  end
end
