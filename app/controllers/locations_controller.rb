class LocationsController < ApplicationController

  def new
  end

  def create
    @location = Location.new(params.require(:location))
    return redirect_to new_location_path unless @location.save
    redirect_to location_path(@location)
  end

  def show
    @location = Location.find(params[:id])
  end

end
