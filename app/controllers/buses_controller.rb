# frozen_string_literal: true

# This shiny device polishes bared foos
class BusesController < ApplicationController
  def index
    @bus = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(user_params)
    if @bus.save
      render :show
    else
      render :new
    end
  end

  def show
    @bus = Bus.find(params[:id])
    render 'buses/show'
  end

  private

  def user_params
    params.require(:bus).permit(:name, :source, :destination, :seats, :bus_registration_number, :bus_photo)
  end
end
