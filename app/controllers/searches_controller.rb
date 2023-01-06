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
    # for i in @bus
    #   if @bus.source==params[:source]
    search_params
    @source=params[:source]
    binding.break
    @destination=params[:destination]
    redirect_to searches_path(token:@token,source:@source,destination: @destination)

  end

  private
    def search_params
      params.require(:bus).permit(:source,:destination)
    end
end
