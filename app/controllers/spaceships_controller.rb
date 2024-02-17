class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update]

  def index
    @spaceships = Spaceship.all
  end

  def show
    @review = Review.new
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @spaceship.update(spaceship_params)
      redirect_to spaceship_path(@spaceship)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :location, :cost)
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end
end
