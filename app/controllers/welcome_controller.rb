require 'net/http'
require 'json'

class WelcomeController < ApplicationController

  skip_before_action :authorize

  def index
    @random_place = Place.first(:offset => rand(Place.count))
    @user = User.find(@random_place.user_id)
    @url = 'http://api.openweathermap.org/data/2.5/weather?q=' << @random_place.location << '&units=imperial&APPID=' << ENV['WEATHER_API_KEY']
    uri = URI(URI.encode(@url))
    response = Net::HTTP.get(uri)
    @json = JSON.parse(response)
    if @json["cod"] == 200
      @icon_url = 'http://openweathermap.org/img/w/' << @json['weather'][0]['icon'] << '.png'
      @description = @json['weather'][0]['description']
      @temperature = @json['main']['temp']
    end

  end
end
