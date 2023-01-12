ActiveAdmin.register Customer do

    actions :index, :edit, :update, :create, :destroy, :new

    permit_params :name, :email, :password, :type

    # menu label: "VIP Clients"

    index do
        column :name
        column :email
        column :password
        column :type

        # column :phone_number
        actions
    end

    form do |f|
      f.inputs 'Customer' do
        f.input :name
        f.input :email
        f.input :password
        f.input :type
      end
      f.actions
    end




    # controller { actions :all, except: [:update] }


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
