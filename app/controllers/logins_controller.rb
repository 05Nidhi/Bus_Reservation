# frozen_string_literal: true

# This shiny device polishes bared foos
class LoginsController < ApplicationController
  skip_before_action :expiration, except: :index

  def new
    @user = Registration.new
  end

  def create
    @user = Registration.find_by_email(params[:email])
    if @user.password == params[:password] && @user.type == params[:type]
      @token = JwtWebToken.jwt_encode(@user.id)
      redirect_to searches_path(token: @token)
    else
      render :new
    end
  end
end
