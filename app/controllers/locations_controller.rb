class LocationsController < ApplicationController
#  before_action :require_login, only: [:new]

  def index
    @locations = Location.all
    console
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :zip_code)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
