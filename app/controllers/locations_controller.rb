class LocationsController < ApplicationController
  before_action :require_login, only: [:new]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location
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
    if session[:user_id]
      render "locations/new"
    else
      flash[:error] = "You must be logged in."
      redirect_to login_path
    end
  end

end
