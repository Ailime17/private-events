class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @past_events = Event.past_events
    @future_events = Event.future_events
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)
    redirect_to user_path(@user) if @event.save
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @event_attending = EventAttending.new
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
