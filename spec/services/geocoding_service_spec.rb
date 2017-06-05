require 'rails_helper'

describe GeocodingService, vcr: :service do
  let(:address) { '25 Ford Ave., Lakewood, New Jersey 87015'}

  context '#initialize' do
    subject { described_class.new(address) }

    it 'requests data from geocoding api' do
      expect(subject).to be_a GeocodingService
    end

    context 'given api is blank' do
      it 'requests data from geocoding api' do
        google_api_key = ENV['GOOGLE_API_KEY']
        ENV['GOOGLE_API_KEY'] = nil
        expect(subject).to be_a GeocodingService
        ENV['GOOGLE_API_KEY'] = google_api_key
      end
    end

    context 'given api key is invalid' do
      it 'responds with error' do
        google_api_key = ENV['GOOGLE_API_KEY']
        ENV['GOOGLE_API_KEY'] = '123'
        expect { subject }.to raise_error('The provided API key is invalid.')
        ENV['GOOGLE_API_KEY'] = google_api_key
      end
    end
  end

  context '#latitude' do
    subject { described_class.new(address).latitude }

    it 'returns latitude from response data' do
      expect(subject).to eq 40.060601
    end
  end

  context '#longitude' do
    subject { described_class.new(address).longitude }

    it 'returns latitude from response data' do
      expect(subject).to eq -74.217748
    end
  end
end
