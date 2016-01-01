class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :diet, :string
    add_column :users, :age, :integer
  end
end
