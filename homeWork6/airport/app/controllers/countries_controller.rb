class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @countries = Country.all
  end

  def show
  #  @city = @countries.cities
  end

  def new
      @country = Country.new
  end

  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to root_url, notice: 'Country was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @country.update(country_params)
      redirect_to root_url, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_country
    @country = Country.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def country_params
    params.require(:country).permit(:name, :image)
  end

end
