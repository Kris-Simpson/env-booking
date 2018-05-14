class EnvironmentsController < ApplicationController
  def show
    @environment = Environment.where(environment_params).first
    @bookings = @environment.bookings.order(:created_at)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def environment_params
    params.permit(:id)
  end
end
