
ActiveAdmin.register Event do
  permit_params :date_start, :date_end, :event_icon, :address, :description,

  show do
    attributes_table do
      row :id
      row :date_start
      row :date_end
      row :event_icon
      row :address
      row :description
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :date_start
    column :date_end
    column :event_icon
    column :address
    actions
  end

  filter :date_start
  filter :date_end

  form do |f|
    f.inputs "Admin Details" do
      f.input :date_start
      f.input :date_end
      f.input :address
      f.input :description
      f.input :event_icon, as: :select, collection: Event::VALID_EVENT_ICONS
    end
    f.actions
  end

end
