class PlanesController < ApplicationController
  before_action :set_plane, only: [:index, :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
    @airport = @plane.airport
    #@category = Category.new(store: @store)
  end

  def new
    @airport = Airport.find(params[:airport_id])
    @plane = @airport.planes.build
  end

  def edit
    #@plane = plane.find(params[:id]).country
  end

  # POST /stores
  # POST /stores.json
  def create
    @airport = Airport.find(params[:airport_id])
    @plane = @airport.planes.create(plane_params)

    #@plane = plane.new(plane_params)

    if @plane.save
      redirect_to airport_path(@airport), notice: 'plane was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @plane.update(plane_params)
      redirect_to airport_path(@airport), notice: 'plane was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @plane.destroy
    redirect_to airport_path(@airport), notice: 'plane was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_plane
    @airport = Airport.find(params[:airport_id])
    @plane = @airport.planes.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def plane_params
    params.require(:plane).permit(:name, :image, :destination)
  end

end
