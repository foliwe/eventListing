class EventsController < ApplicationController
  before_action :authenticate_user , except: [:index, :show]
  before_action :verify_admin, except:[:index, :show]
  before_action :set_events, only: [:show, :edit, :update, :destroy]
  def index
    case params[:filter] 
    when "past"
      @events = Event.past 
    when "free"
      @events = Event.free 
    when "recent"
      @events = Event.recent 
    else
      @events = Event.upcoming
    end
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
    @likers =@event.likers
    @near_by_events = Event.close_by(@event.location).excluding(@event)
    @categories = @event.categories
    if current_user
      @like = current_user.likes.find_by(event_id: @event.id)
    end
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
    @event = Event.friendly.find(params[:id])
  end

  def verify_ower
    if current_user && current_user.id != @event.id 
      redirect_to root_path alert: "Access denial! "
    end
  end

  def event_params
    params.require(:event).permit(:name, :location, :description, :price, :starts_at, :capacity, category_ids:[])
  end

end
