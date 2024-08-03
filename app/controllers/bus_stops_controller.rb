require 'faraday'
require 'json'

class BusStopsController < ApplicationController
  def index
    @longest_route = BusStop.group(:routes).count.max_by { |_, count| count }
    @most_common_bus_route = BusStop.group(:on_street, :cross_street).count.max_by { |_, count| count }
  end
end
