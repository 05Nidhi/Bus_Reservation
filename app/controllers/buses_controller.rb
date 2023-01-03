# frozen_string_literal: true

# This shiny device polishes bared foos
class BusesController < ApplicationController
  include JwtWebToken

  # before_action :expiration, only: %i[show update destroy create]
  # before_action :expiration

  def index
    binding.break
    @bus = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    binding.break
    @bus = Bus.new(user_params)
    expiration(@bus.token)
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

  # def expiration(token)
  #   binding.break
  #   user_id = JwtWebToken.jwt_decode(token)['id']
  #   @user = User.find(user_id)
  #   # render json: {user:user,message:"Valid Token"}
  # rescue JWT::ExpiredSignature
  #   render json: { error: 'Token has expired' }
  # end
end
