class ChangeBioToText < ActiveRecord::Migration
  def change
    change_column :wedding_party_members, :bio, :text
  end
end
