class UsersController < ApplicationController
  def show
    @current_user = current_user
    @user_spaceship = Spaceship.where(user_id: @current_user.id)

  end
end
