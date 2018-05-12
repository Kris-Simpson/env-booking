class BookedEnvironmentsController < ApplicationController
  def create
    @booking = current_user.booked_environments.create!(booked_environment_params)
    @environment = @booking.environment

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @booking = current_user.booked_environments.where(booked_environment_params).first.destroy
    @environment = @booking.environment

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def booked_environment_params
    params.permit(:id, :environment_id)
  end
end
