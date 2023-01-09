class SearchesController < ApplicationController
  def index
    @source = params[:source]
    @destination = params[:destination]
    a=Bus.where(source:@source,destination:@destination)
    if a.count==0
      @bus=Bus.all
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

  private
    def search_params
      params.require(:bus).permit(:source,:destination)
    end
end
