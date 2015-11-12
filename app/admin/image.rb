ActiveAdmin.register Image do
  permit_params :imageable_id, :imageable_type, :photo 

  index do
    selectable_column
    id_column
    column :imageable_id
    column :imageable_type
    column :photo
    column :created_at
    actions
  end

  form(:html => { :multipart => true })  do |f|
    f.inputs "Admin Details" do
      f.input :imageable_type, as: :select, collection: ActiveRecord::Base.descendants.map(&:to_s)
      f.input :imageable_id, label: 'Imageable Id'
      f.input :photo, :for => :image, :as => :file
    end
    f.actions
  end

end
