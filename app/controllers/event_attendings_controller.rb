class EventAttendingsController < ApplicationController

  before_action :authenticate_user!, only: :create

  def create
    @user = current_user
    @e = Event.find(params[:event_attending][:attended_event_id])

    @e.attendees << @user unless @e.attendees.exists?(@user.id)
    redirect_to event_path(@e)
  end
end
