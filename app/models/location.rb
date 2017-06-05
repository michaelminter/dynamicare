class Location < ApplicationRecord
  before_save :find_latitude_longitude

  validates :address, presence: true

  private

  def find_latitude_longitude
    geo_data = GeocodingService.new(address)

    self.latitude = geo_data.latitude
    self.longitude = geo_data.longitude
  rescue => e
    self.errors[:base] << e.message
  end
end
