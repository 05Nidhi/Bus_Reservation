class TicketsController < ApplicationController

  def new
    @ticket=Ticket.new
  end

  def create
    @ticket=Ticket.new(ticket_params)
    binding.break
    a=Bus.where(source:@ticket.ticket_source,destination:@ticket.ticket_destination,name:@ticket.name).first
    @seats=a.seats_numbers
    redirect_to edit_ticket_path(token:@token,ticket:@ticket,seats:@seats)


    if @ticket.save
      redirect_to logins_new_path(token:@token)
    else
      render :new
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:name,:ticket_source,:ticket_destination,:ticket_date)
    end
end
