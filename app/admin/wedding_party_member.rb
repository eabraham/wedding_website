ActiveAdmin.register WeddingPartyMember do
  permit_params :name, :bio, :bride_side, :party_order

  index do
    selectable_column
    id_column
    column :name
    column :bio
    column :bride_side
    column :party_order
    column :created_at
    actions
  end

  filter :name
  filter :bio
  filter :bride_side
  filter :party_order
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :bio
      f.input :bride_side
      f.input :party_order
    end
    f.actions
  end

end
