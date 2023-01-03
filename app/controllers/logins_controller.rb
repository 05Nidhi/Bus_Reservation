# frozen_string_literal: true

# This shiny device polishes bared foos
class LoginsController < ApplicationController
  # after_action :create

  def index
    @bus = Bus.all
  end

  def new
    @user = Registration.new
  end

  def create
    @user = Registration.find_by_email(params[:email])
    if @user.password == params[:password] && @user.type == params[:type]
      if params[:type] == 'BusOwner'
        render '/buses/list'
      else
        render '/logins/login'
      end
    else
      render :new
    end
  end
end
