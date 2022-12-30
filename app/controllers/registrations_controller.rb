class RegistrationsController < ApplicationController
  def new
    @customer= Registration.new
  end

  def create
    @customer=Registration.new(user_params)
    if @customer.save
      # render '/login/new'
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:registration).permit(:name,:email,:password,:type)
    end
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
      model: [:attribute1, :attribute2, etc]
    end
end
