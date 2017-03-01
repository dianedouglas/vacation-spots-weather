require 'net/http'
require 'json'

class Place < ActiveRecord::Base
  validates :location, :image_url, :visit_length, :favorite_memory, presence: true
  belongs_to :user
  def get_weather
    description = ''
    temperature = 0
    icon_url = ''
    status = 0
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{location}&units=imperial&APPID=#{ENV['WEATHER_API_KEY']}"
    uri = URI(URI.encode(url))
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    if json.key?('cod')
      status = json['cod']
    end
    if status == 200
      icon_url = "http://openweathermap.org/img/w/#{json['weather'][0]['icon']}.png"
      description = json['weather'][0]['description']
      temperature = json['main']['temp']
    end
    { 
      description: description,
      temperature: temperature,
      icon_url: icon_url,
      status: status 
    }
  end
end
