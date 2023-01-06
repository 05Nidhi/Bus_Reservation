class TicketsController < ApplicationController

  def new
    @bus=Bus.find_by_id(params[:bus_id])
    # @ticket=Ticket.new
    # @seat_numbers = @bus.seat_numbers
    # @seat_number = @bus.seat_numbers.new
    # @source = params[:source]
    # @name = params[:name]
    # @destination = params[:destination]
  end

  def create

    binding.break
    @bus=Bus.find_by_id(params[:bus_id])
    a=params[:seat_no]
    for i in @bus.seat_numbers
      binding.break
      if i.seat_no include a
        @bus.seat_numbers.update(seat_status:true)
      end
    end


    # binding.break
    # a=Bus.where(source:@ticket.ticket_source,destination:@ticket.ticket_destination,name:@ticket.name).first
    # @seats=a.seat_numbers
    # redirect_to ticket_path(token:@token,ticket:@ticket,seats:@seats)


    # if @ticket.save
    #   redirect_to logins_new_path(token:@token)
    # else
    #   render :new
    # end
  end

  private

    def ticket_params
      # params.require(:ticket).permit(status:[])
    end
end
