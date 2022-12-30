class LoginsController < ApplicationController
  # after_action :create

  def new
    @user=Registration.new
  end
  def create
    binding.break
    @user=Registration.find_by_email(params[:email])
    if @user.name == params[:name] && @user.password == params[:password] && @user.type == params[:type]
      binding.break
      flash.now[:alert] = 'Login Sucessfull'
      render "login/login"
    else
      binding.break
      flash.now[:alert] = 'Please enter valid info'
    end
  end
end
