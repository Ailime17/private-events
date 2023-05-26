class EventAttendingsController < ApplicationController

  def create
    @user = current_user
    @e = Event.find(params[:event_attending][:attended_event_id])

    @e.attendees << @user
    redirect_to event_path(@e)
  end
end
