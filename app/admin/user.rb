ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :full_name

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
    column :current_sign_in_at
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
      f.input :full_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
