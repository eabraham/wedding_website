ActiveAdmin.register Guestbook do
  permit_params :approved

  index do
    selectable_column
    id_column
    column :from
    column :body
    column :poster_id
    column :approved
    actions
  end

  filter :parent
  filter :child

  form do |f|
    f.inputs "Admin Details" do
      f.input :from
      f.input :body
      f.input :poster_id
      f.input :approved
    end
    f.actions
  end

end