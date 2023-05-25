class UsersController < ApplicationController
  def show
    @user = current_user
    @user_created_events = @user.created_events
    @user_attended_events = @user.attended_events
  end
end
