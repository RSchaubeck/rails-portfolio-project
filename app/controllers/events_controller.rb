class EventsController < ApplicationController
  def index
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id])
        if @location.events.empty?
          flash[:alert] = "This location has no events."
          redirect_to locations_path
        else
          @events = @location.events
        end
    else
      @events = Event.all
    end
  end

  def new
  end

  def create
    location = Location.find_by(name: params[:event][:location_name])
    if location.nil?
      redirect_to new_location_path
    else
      @event = Event.new(event_params)
      @event.location_id = location.id
      return redirect_to new_event_path unless @event.save!
      redirect_to event_path(@event)
    end
  end

  def show
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id])
      @event = @location.events.find_by(id: params[:id])
      if @event.nil?
        flash[:alert] = "Event not found."
        redirect_to location_events_path(@location)
      end
    else
      @event = Event.find(params[:id])
    end
  end



  private

  def event_params
    params.require(:event).permit(:name, :location_name, :month, :day, :year, :start_hour, :start_minutes, :end_hour, :end)
  end

end
