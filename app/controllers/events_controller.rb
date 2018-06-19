class EventsController < ApplicationController
  def index
    if params[:location_id]
      location = Location.find_by(id: params[:location_id])
        if location.nil?
          flash[:alert] = "Location not found."
          redirect_to locations_path
        else
          @events = location.events
        end
    else
      @events = Event.all
    end
  end

  def new
  end

  def create
  end

  def show

  end
end
