class BookedEnvironmentsController < ApplicationController
  def create
    current_user.booked_environments.create!(booked_environment_params)
  end

  def destroy
    current_user.booked_environments.where(booked_environment_params).first.destroy
  end

  private

  def booked_environment_params
    params.permit(:id, :environment_id)
  end
end
