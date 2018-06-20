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

  def show
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id])
      @event = @location.songs.find_by(id: params[:id])
      if @event.nil?
        flash[:alert] = "Event not found."
        redirect_to location_events_path(@location)
      end
    else
      @event = Event.find(params[:id])
    end
  end

  def create
  end

end
