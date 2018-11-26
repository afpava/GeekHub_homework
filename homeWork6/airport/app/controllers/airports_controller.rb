class AirportsController < ApplicationController
  before_action :set_airport, only: [:index, :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @airports = Airport.all
  end

  def show
    @airport = Airport.find(params[:id])
    @city=@airport.city
    #@category = Category.new(store: @store)
  end

  def new
    @city = Cityy.find(params[:city_id])
    @airport = @city.airports.build
  end

  def edit
    #@airport = airport.find(params[:id]).country
  end

  # POST /stores
  # POST /stores.json
  def create
    @city = City.find(params[:city_id])
    @airport = @city.airports.create(airport_params)

    #@airport = airport.new(airport_params)

    if @airport.save
      redirect_to city_path(@city), notice: 'airport was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @airport.update(airport_params)
      redirect_to city_path(@city), notice: 'airport was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @airport.destroy
    redirect_to city_path(@city), notice: 'airport was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_airport
    @city = City.find(params[:city_id])
    @airport = @city.airports.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def airport_params
    params.require(:airport).permit(:name, :image)
  end

end
