class TicketsController < ApplicationController

  before_action :set_ticket, only: [:index, :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @passenger=@ticket.passenger
    #@category = Category.new(store: @store)
  end

  def new
    @passenger = Passenger.find(params[:passenger_id])
    @ticket = @passenger.tickets.build
  end

  def edit
    #@ticket = ticket.find(params[:id]).country
  end

  # POST /stores
  # POST /stores.json
  def create
    @passenger = Passenger.find(params[:passenger_id])
    @ticket = @passenger.tickets.create(ticket_params)

    #@ticket = ticket.new(ticket_params)

    if @ticket.save
      redirect_to passenger_path(@passenger), notice: 'ticket was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @ticket.update(ticket_params)
      redirect_to passenger_path(@passenger), notice: 'ticket was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @ticket.destroy
    redirect_to passenger_path(@passenger), notice: 'ticket was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @passenger = Passenger.find(params[:passenger_id])
    @ticket = @passenger.tickets.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:name, :image, :destination )
  end

end
