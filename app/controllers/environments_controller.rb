class EnvironmentsController < ApplicationController
  def show
    @environment = Environment.where(environment_params).first

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def environment_params
    params.permit(:id)
  end

  def booking_params
    params.permit(:environment_id)
  end
end
