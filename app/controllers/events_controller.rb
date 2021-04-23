class EventsController < ApplicationController

  before_action :set_events, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.upcoming_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event), notice: "Event Successfully created"
    else
      render :new
    end
  end

  def show
    
    @near_by = Event.events_close_by(@event.location).to_s
  end

   def edit
     
   end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event),notice: "Event Successfully Updated"
    else
      render :edit
    end
  end


  def destroy
    @event.destroy
    redirect_to events_path
  end

  private 

  def set_events
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :description, :price, :starts_at, :capacity)
  end
end
