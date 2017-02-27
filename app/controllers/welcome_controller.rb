class WelcomeController < ApplicationController

  skip_before_action :authorize

  def index
    # @thing = ENV["test_thing"]
  end
end
