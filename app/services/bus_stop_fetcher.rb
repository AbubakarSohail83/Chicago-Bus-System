class BusStopFetcher
  def self.fetch_data
    url = 'https://data.cityofchicago.org/resource/mq3i-nnqe.json?'
    connection = Faraday.new
    response = connection.get(url)
    raise "API request failed with status: #{response.status}" unless response.success?

    JSON.parse(response.body)
  end
end
