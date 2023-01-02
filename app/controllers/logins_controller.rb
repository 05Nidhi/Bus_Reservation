class LoginsController < ApplicationController
  # after_action :create

  def new
    @user=Registration.new
  end
  def create
    @user=Registration.find_by_email(params[:email])
    if @user.password == params[:password] && @user.type == params[:type]
      flash.now[:alert] = 'Login Sucessfull'
      render "logins/login"
    else
      flash.now[:alert] = 'Please enter valid info'
    end
  end

end
