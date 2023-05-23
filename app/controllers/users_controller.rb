class UsersController < ApplicationController
  def show
    @user = current_user
    @user_events = @user.created_events
  end
end
