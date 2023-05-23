class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @event = @user.created_events.create(event_params)
    redirect_to user_path(@user)
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :creator_id)
  end
end
