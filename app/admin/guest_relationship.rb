ActiveAdmin.register GuestRelationship do
  permit_params :parent_id, :child_id

  index do
    selectable_column
    id_column
    column :parent
    column :child
    actions
  end

  filter :parent
  filter :child

  form do |f|
    f.inputs "Admin Details" do
      f.input :parent, as: :select, collection: User.all
      f.input :child, as: :select, collection: User.all
    end
    f.actions
  end

end
