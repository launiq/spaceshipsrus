class BookingsController < ApplicationController
  before_action :set_booking

  def accept
    # 1. change the value of the booking status to the string accept
  end

  def decline
    # 1. change the value of the booking status to the string decline
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
