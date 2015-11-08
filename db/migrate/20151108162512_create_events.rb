class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.references :image, index: true
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
