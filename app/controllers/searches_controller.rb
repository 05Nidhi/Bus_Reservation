class SearchesController < ApplicationController
  def index
    a=Bus.where('lower(source) LIKE lower(?) AND lower(destination) LIKE lower(?)', "%#{params[:source]}%", "%#{params[:destination]}%")

    if a.count==0
      @bus=nil
    else
      @bus=a
    end
  end

  def new
    @search = Ticket.new
  end

  def create
    @source=params[:source]
    @destination=params[:destination]
    redirect_to searches_path(token:@token,source:@source,destination: @destination,flag:true)
  end
end
