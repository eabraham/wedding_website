ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :full_name, 
                :group, :rsvp, :brunch_rsvp, :tour_rsvp, :dinner_rsvp, 
                :hotel_friday, :hotel_saturday, :hotel_sunday, :is_child, :diet, :age

  controller do
    def update
      @user = User.find(params[:id])
      @user.update_without_password(permitted_params[:user])
      update! do |format|
        format.html { redirect_to admin_users_path }
      end
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :full_name
    column :role
    column :group
    column :rsvp
    column :brunch_rsvp
    column :tour_rsvp
    column :dinner_rsvp
    column :hotel_friday
    column :hotel_saturday
    column :hotel_sunday
    column :current_sign_in_atx
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :full_name
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :role, as: :select, collection: User::VALID_ROLES
      f.input :group, as: :select, collection: User::GROUPS
      f.input :full_name
      f.input :password
      f.input :password_confirmation
      f.input :rsvp
      f.input :brunch_rsvp
      f.input :tour_rsvp
      f.input :dinner_rsvp
      f.input :hotel_friday
      f.input :hotel_saturday
      f.input :hotel_sunday
      f.input :is_child
      f.input :diet
      f.input :age
    end
    f.actions
  end

end
