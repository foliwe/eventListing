class RegistrationsController < ApplicationController
before_action :authenticate_user , except: [:index]
before_action :set_event_id
#before_action :no_duplicate
  def index
    @registration = @event.registrations
  end

  def new
    if @event.sold_out
      redirect_to events_path,alert: "All Tickets Sold Out"
    else
     @registration = @event.registrations.new
    end
  end

  def create

    @registration = @event.registrations.new(registration_params)
     @registration.user = current_user
      if @registration.save
        redirect_to event_registrations_path(@event), notice: "You are Now Register For the event"
      else
        render :new
      end
 

  end


  private

  def set_event_id
    @event = Event.find(params[:event_id])
  end

  def registration_params
    params.require(:registration).permit(:how_heard, :event_id, :user_id)
  end

 
end
