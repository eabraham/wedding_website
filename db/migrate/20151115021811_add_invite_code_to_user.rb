class AddInviteCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :invite_code, :integer
  end
end
