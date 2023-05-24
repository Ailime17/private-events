class EventAttendingsController < ApplicationController
  def create
    @user = current_user
    @e = Event.find(params[:event_attending][:attended_event_id])
    redirect_to root_path, status: :see_other if @e.attendees << @user
  end
end
