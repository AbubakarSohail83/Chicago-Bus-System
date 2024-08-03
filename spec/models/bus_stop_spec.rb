require 'rails_helper'

RSpec.describe BusStop, type: :model do
  describe '.longest_route' do
    it 'returns the route with the most stops' do
      create(:bus_stop, routes: ['Route 1', 'Route 2'])
      create(:bus_stop, routes: ['Route 1', 'Route 3'])

      longest_route, count = BusStop.longest_route
      expect(longest_route).to eq('Route 1')
      expect(count).to eq(2)
    end
  end

  describe '.most_common_stop' do
    it 'returns the most common stop based on on_street and cross_street' do
      create(:bus_stop, on_street: 'Main St', cross_street: '1st Ave')
      create(:bus_stop, on_street: 'Main St', cross_street: '1st Ave')
      create(:bus_stop, on_street: 'Second St', cross_street: '1st Ave')

      common_stop = BusStop.most_common_stop
      expect(common_stop.on_street).to eq('Main St')
      expect(common_stop.cross_street).to eq('1st Ave')
    end
  end
end
