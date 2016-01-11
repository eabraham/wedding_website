class AddApprovalToGuestbook < ActiveRecord::Migration
  def change
    add_column :guestbooks, :approved, :boolean, default: false
  end
end
