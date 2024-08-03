class BusStop < ApplicationRecord
  def self.longest_route
    all_routes = BusStop
                 .select('UNNEST(routes) AS individual_route, COUNT(*) AS number_of_stops')
                 .group('individual_route')
                 .order(Arel.sql('COUNT(*) DESC'))
                 .limit(1)
                 .to_a

    all_routes.map do |route|
      [route.individual_route, route.number_of_stops.to_i]
    end.first || [nil, 0]
  end

  def self.most_common_stop
    select(:on_street, :cross_street, 'COUNT(*) AS number_of_routes')
      .group(:on_street, :cross_street)
      .order('number_of_routes DESC')
      .limit(1)
      .first
  end
end
