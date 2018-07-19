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
  end

  def rsvp
    if session[:user_id]
      event = EventsUser.find_by(event_id: params[:event_id])
      event.user_id = session[:user_id]
      event.save
      redirect_to user_path(session[:user_id])
    else
      redirect_to login_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end_time)
  end

end
