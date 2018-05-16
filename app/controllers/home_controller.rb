class HomeController < ApplicationController
  def index
    @environments = Environment.all.includes(:bookings).order(:created_at)
  end
end
