class GeocodingService
  def initialize(address, options = {})
    @api_key = options[:api_key] || ENV['GOOGLE_API_KEY']
    @address = address
    @request = RestClient.get('https://maps.googleapis.com/maps/api/geocode/json', request_params)

    raise(data[:error_message]) if data[:error_message]
  end

  def data
    JSON.parse(@request).with_indifferent_access
  end

  def latitude
    pp data
    data[:results][0][:geometry][:location][:lat]
  end

  def longitude
    data[:results][0][:geometry][:location][:lng]
  end

  private

  def request_params
    {
      params: {
        address: @address,
        key: @api_key
      }
    }
  end
end
