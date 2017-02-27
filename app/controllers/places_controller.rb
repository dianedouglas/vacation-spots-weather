require 'net/http'
require 'json'

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.where(user_id: current_user.id)
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @url = 'http://api.openweathermap.org/data/2.5/weather?q=' << @place.location << '&units=imperial&APPID=' << ENV['WEATHER_API_KEY']
    uri = URI(URI.encode(@url))
    response = Net::HTTP.get(uri)
    @json = JSON.parse(response)
    if @json["cod"] == 200
      @icon_url = 'http://openweathermap.org/img/w/' << @json['weather'][0]['icon'] << '.png'
      @description = @json['weather'][0]['description']
      @temperature = @json['main']['temp']
    end

  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render action: 'show', status: :created, location: @place }
      else
        format.html { render action: 'new' }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params.merge(user_id: current_user.id))
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:location, :image_url, :visit_length, :favorite_memory)
    end
end
