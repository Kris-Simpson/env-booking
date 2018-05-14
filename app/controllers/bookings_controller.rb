class BookingsController < ApplicationController
  def create
    @booking = current_user.bookings.create(booking_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @booking = current_user.bookings.where(booking_params).first.destroy
    @environment = @booking.environment

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def booking_params
    params.permit(:id, :environment_id, :duration)
  end
end
