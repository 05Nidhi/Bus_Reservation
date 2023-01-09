class TicketsController < ApplicationController

  def index
  end

  def new
    @bus=Bus.find_by_id(params[:bus_id])
  end

  def create
    @bus=Bus.find_by_id(params[:bus_id])
    if params[:seat_no].nil?
      flash.alert = "seat can't be nil!!"
      render :new
    end
    a=params[:seat_no]
    a=a.split(/,/)
    b=Ticket.where(ticket_date: params[:ticket_date]) and Ticket.where(ticket_seat_no: params[:seat_no])

    if b.count == 0
      Ticket.create(name:params[:name],ticket_source:params[:source],ticket_destination:params[:destination],ticket_date:params[:ticket_date],ticket_seat_no:params[:seat_no])
      @bus.seat_numbers.where(seat_no:a).update(seat_status:true)
      redirect_to tickets_path(token: @token , bus_id: @bus.id , flag: true)
    else
      flash.alert = "Ticket of that date and that seat was already taken"
      redirect_to tickets_new_path(token: @token , bus_id: @bus.id , flag: true)

    end
  end
end
