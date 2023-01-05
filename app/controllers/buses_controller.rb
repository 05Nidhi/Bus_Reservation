# frozen_string_literal: true

# This shiny device polishes bared foos
class BusesController < ApplicationController
  include JwtWebToken

  # before_action :expiration, only: %i[show update destroy create]
  # before_action :check_token

  def index
    @bus = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to bus_path(@bus.id, token: @token)

    else
      render :new
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :source, :destination, :seats, :bus_registration_number, :bus_photo)
  end
end
