class LocationsController < ApplicationController
  before_action :set_locations

  def index
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to root_url, notice: 'Location has been saved.'
    else
      render :index
    end
  end

  private

  def location_params
    params.require(:location).permit(:address)
  end

  def set_locations
    @locations = Location.all
  end
end
