class BookingsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spaceship = Spaceship.find(params[:spaceship_id])
    @booking.user = current_user

    if @booking.save
      redirect_to spaceship_path(@booking.spaceship)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
