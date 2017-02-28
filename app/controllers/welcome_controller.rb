class WelcomeController < ApplicationController

  skip_before_action :authorize

  def index
    @random_place = Place.first(:offset => rand(Place.count))
    @user = User.find(@random_place.user_id)
    @weather = @random_place.get_weather
  end
end
