class EventsController < ApplicationController

  def index
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id])
        if @location.events.empty?
          flash[:alert] = "This location has no events. Please add one below."
          redirect_to new_event_path
        else
          @events = @location.events
        end
    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    location = Location.find(params[:event][:location])
    @event = Event.new(event_params)
    @event.location_id = location.id
    if @event.save
      EventsUser.create(event_id: @event.id)
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(@event.location_id)
#    if params[:location_id]
#      @location = Location.find_by(id: params[:location_id])
#      @event = @location.events.find_by(id: params[:id])
#      if @event.nil?
#        flash[:alert] = "Event not found."
#        redirect_to location_events_path(@location)
#      end
#    else
#      @event = Event.find(params[:id])
#    end
  end

  def rsvp
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end_time)
  end

end
