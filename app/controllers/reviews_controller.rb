class ReviewsController < ApplicationController
  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @review = Review.new(review_params)
    @review.spaceship = @spaceship
    if @review.save
      redirect_to spaceship_path(@spaceship)
    else
      render "spaceships/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
