class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end
end
