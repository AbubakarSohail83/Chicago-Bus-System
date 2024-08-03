# spec/controllers/bus_stops_controller_spec.rb
require 'rails_helper'

RSpec.describe BusStopsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @longest_route' do
      longest_route = ['Route 1', 5]
      allow(BusStop).to receive(:longest_route).and_return(longest_route)

      get :index

      expect(assigns(:longest_route)).to eq(longest_route)
    end
  end
end
