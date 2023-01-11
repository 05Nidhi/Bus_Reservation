# frozen_string_literal: true

# This shiny device polishes bared foos
class BusesController < ApplicationController
  include JwtWebToken

  # before_action :expiration, only: %i[show update destroy create]
  # before_action :check_token

  def index
    @source = params[:source]
    @destination = params[:destination]
    a=Bus.where(source:@source,destination:@destination)
    binding.break
    @bus=Bus.all
    # if a.count==0
    #   @bus=Bus.all
    # else
    #   @bus=a
    # end
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      @bus.no_of_seats.times do |i|
        @bus.seat_numbers.create(seat_no:i+1,seat_status:false)
      end
      redirect_to bus_path(@bus.id, token: @token , flag:true)
    else
      render :new
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :source, :destination, :bus_registration_number, :bus_photo,:no_of_seats)
  end
end
