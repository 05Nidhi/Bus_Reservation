class LoginsController < ApplicationController
  # after_action :create

  def new
    @user=Registration.new
  end
  def create
    @user=Registration.find_by_email(params[:email])
    if @user.password == params[:password] && @user.type == params[:type]
      binding.break
      if params[:type] == 'BusOwner'
        render '/buses/index'
      else
        render "logins/login"
      end
    else
      flash.now[:alert] = 'Please enter valid info'
    end
  end

end
