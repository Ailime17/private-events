class EventAttendingsController < ApplicationController

  def create
    @user = current_user
    @e = Event.find(params[:event_attending][:attended_event_id])

    @e.attendees << @user
    redirect_to event_path(@e)
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:id])
    # @attendee = @event.attendees.find(@user.id)
    @event.attendees.destroy(@user)

    redirect_to event_path(@event)
  end

end
