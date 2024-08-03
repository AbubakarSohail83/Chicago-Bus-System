namespace :db do
  desc 'Fetch ridership data from the API and load into the database'
  task fetch_data: :environment do
    url = 'https://data.cityofchicago.org/resource/mq3i-nnqe.json?'
    connection = Faraday.new
    response = connection.get(url)
    raise "API request failed with status: #{response.status}" unless response.success?

    JSON.parse(response.body).each do |stop_data|
      BusStop.find_or_create_by(stop_id: stop_data['stop_id']) do |bus_stop|
        bus_stop.stop_id = stop_data['stop_id']
        bus_stop.on_street = stop_data['on_street']
        bus_stop.cross_street = stop_data['cross_street']
        bus_stop.routes = stop_data['routes']
        bus_stop.boardings = stop_data['boardings']
        bus_stop.alightings = stop_data['alightings']
        bus_stop.month_beginning = stop_data['month_beginning']
        bus_stop.daytype = stop_data['daytype']
        bus_stop.location = stop_data['location']
      end
    end
  end
end
