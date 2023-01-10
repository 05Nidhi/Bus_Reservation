# frozen_string_literal: true

# This shiny device polishes bared foos
class LoginsController < ApplicationController
  skip_before_action :expiration, except: :index

  def new
    user=Registration.where(flag: true)
    if user.count == 0
      @user = Registration.new
    else
      redirect_to root_path
    end
  end

  def create
    @user = Registration.find_by_email(params[:email])
    if @user.password == params[:password] && @user.type == params[:type]
      @token = JwtWebToken.jwt_encode(@user.id)
      @user.flag = true
      @user.save
      redirect_to searches_path(token: @token)
    elsif @user.password == nil || @user.type == nil || @user.password != params[:password] && @user.type != params[:type]
      flash.alert = "User not exist "
    else
      flash.alert = "User not exist "
      render :new
    end
  end
end
