class PassengersController < ApplicationController
  before_action :set_passenger, only: [:index, :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
    @plane=@passenger.plane
    #@category = Category.new(store: @store)
  end

  def new
    @plane = Plane.find(params[:plane_id])
    @passenger = @plane.passengers.build
  end

  def edit
    #@passenger = passenger.find(params[:id]).country
  end

  # POST /stores
  # POST /stores.json
  def create
    @plane = Plane.find(params[:plane_id])
    @passenger = @plane.passengers.create(passenger_params)

    #@passenger = passenger.new(passenger_params)

    if @passenger.save
      redirect_to plane_path(@plane), notice: 'passenger was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @passenger.update(passenger_params)
      redirect_to plane_path(@plane), notice: 'passenger was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @passenger.destroy
    redirect_to plane_path(@plane), notice: 'passenger was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_passenger
    @plane = Plane.find(params[:plane_id])
    @passenger = @plane.passengers.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def passenger_params
    params.require(:passenger).permit(:name, :image, :phone_number, :passport )
  end

end
