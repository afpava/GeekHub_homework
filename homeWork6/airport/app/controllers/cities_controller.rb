class CitiesController < ApplicationController
  before_action :set_city, only: [:index, :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @country=@city.country
    #@category = Category.new(store: @store)
  end

  def new
    @country = Country.find(params[:country_id])
    @city = @country.cities.build
    end

  def edit
    #@city = City.find(params[:id]).country

  end

  # POST /stores
  # POST /stores.json
  def create
    @country = Country.find(params[:country_id])
  	@city = @country.cities.create(city_params)

    #@city = City.new(city_params)

    if @city.save
      redirect_to country_path(@country), notice: 'City was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @city.update(city_params)
      redirect_to country_path(@country), notice: 'City was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @city.destroy
    redirect_to country_path(@country), notice: 'City was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @country = Country.find(params[:country_id])
    @city = @country.cities.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def city_params
    params.require(:city).permit(:name, :image)
  end

end
