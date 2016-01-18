class AddAwsUrlToImage < ActiveRecord::Migration
  def change
    add_column :images, :aws_url, :string
  end
end
