ActiveAdmin.register BusOwner do

  actions :index, :edit, :update, :create, :destroy, :new

  permit_params :name, :email, :password, :type

  index do
    column :name
    column :email
    column :password
    column :type
    actions
  end

  form do |f|
    f.inputs 'BusOwner' do
      f.input :name
      f.input :email
      f.input :password
      f.input :type
    end
    f.actions
  end



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :password, :password_digest, :type, :flag
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password, :password_digest, :type, :flag]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
