class BusesController < ApplicationController
  def new
    @bus=Bus.new
  end

  def create
    @bus=Bus.new(user_params)
    binding.break
    if @bus.save
      # render '/logins/new'
    else
      render :new
    end
  end

  def show
    binding.break
    @user = Bus.find(params[:id])
    render "buses/show"
  end

  private
    def user_params
      binding.break
      params.require(:bus).permit(:name,:source,:destination,:seats,:bus_registration_number,:bus_photo)
    end
end
