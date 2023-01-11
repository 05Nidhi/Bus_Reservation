class TicketsController < ApplicationController
  before_action :abc, only: [:create]

  def index
    @bus=Bus.find_by_id(params[:bus_id])
    seat=@bus.seat_numbers
    @seats=seat.where.not(seat_date:params[:ticket_date],seat_status:true)
    redirect_to tickets_new_path(ticket_date: params[:ticket_date], token:@token, bus_id: @bus.id)

  end

  def new
    @ticket_date = params[:ticket_date] || Date.today
    @bus=Bus.find_by_id(params[:bus_id])
    seat=@bus.seat_numbers
    @seats=seat.where.not(seat_date:@ticket_date,seat_status:true)
    if @seats.count==0
      @seats=seat
    else
      @seats=@seats.all
    end
  end

  def create
    abc
    if @ticket_match.count == 0
      ticket=Ticket.new(ticket_params)
      if ticket.save
        @bus.seat_numbers.where(seat_no:@seat_no).update(seat_date:@ticket_date,seat_status:true)
        redirect_to searches_path(token: @token , bus_id: @bus.id , flag: true)
      else
        flash.alert = ticket.errors.full_messages
        redirect_to tickets_new_path(token: @token, bus_id: @bus.id)
      end
    else
      flash.alert = "Ticket of that date and that seat was already taken"
      redirect_to tickets_new_path(token: @token , bus_id: @bus.id , flag: true)
    end
  end

  private

    def ticket_params
      params.permit(:name, :ticket_source, :ticket_destination, :ticket_date, :ticket_seat_no, :bus_id)
    end

    def abc
      @ticket_date = params[:ticket_date] || Date.today

      @bus=Bus.find_by_id(params[:bus_id])
      # if params[:seat_no].blank?
      #   flash.alert = "seat can't be nil!!"
      #   return redirect_to tickets_new_path(token: @token, bus_id: @bus.id )
      # end
      params[:ticket_source] = params[:source]
      params[:ticket_destination] = params[:destination]

      @seat_no=params[:ticket_seat_no]
      @seat_no=@seat_no.split(/,/)
      @ticket_match=Ticket.where(ticket_date: @ticket_date,ticket_seat_no: params[:seat_no],bus_id: @bus.id)
    end
end
