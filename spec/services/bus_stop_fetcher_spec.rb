# spec/services/bus_stop_fetcher_spec.rb
require 'rails_helper'

RSpec.describe BusStopFetcher do
  describe '.fetch_data' do
    let(:url) { 'https://data.cityofchicago.org/resource/mq3i-nnqe.json?' }

    before do
      stub_request(:get, url)
        .to_return(status: response_status, body: response_body)
    end

    context 'when the API call is successful' do
      let(:response_status) { 200 }
      let(:response_body) { '[{"stop_id": "10000"}]' }

      it 'returns parsed JSON data' do
        expect(described_class.fetch_data).to eq([{ 'stop_id' => '10000' }])
      end
    end

    context 'when the API call fails' do
      let(:response_status) { 500 }
      let(:response_body) { 'Internal Server Error' }

      it 'raises an exception' do
        expect { described_class.fetch_data }.to raise_error(RuntimeError)
      end
    end
  end
end
