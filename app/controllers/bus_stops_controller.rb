require 'faraday'
require 'json'

class BusStopsController < ApplicationController
  def index
    @longest_route = BusStop.longest_route
  end
end
