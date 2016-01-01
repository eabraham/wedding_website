class AddChildToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_child, :boolean, default: false
  end
end
