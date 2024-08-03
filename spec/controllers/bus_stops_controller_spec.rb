require 'rails_helper'

RSpec.describe BusStopsController, type: :controller do
  describe "GET #index" do
    it 'assigns the longest route to @longest_route' do
      create_list(:bus_stop, 2, routes: ['A', 'B'])

      get :index
      expect(assigns(:longest_route)).to eq(['A', 2])
    end

    it 'assigns the most common bus route to @most_common_bus_route' do
      create(:bus_stop, on_street: 'Street1', cross_street: 'CrossStreet1')
      create(:bus_stop, on_street: 'Street1', cross_street: 'CrossStreet1')
      create(:bus_stop, on_street: 'Street2', cross_street: 'CrossStreet2')

      get :index
      expect(assigns(:most_common_bus_route)).to eq(['Street1', 'CrossStreet1', 2])
    end
  end
end
