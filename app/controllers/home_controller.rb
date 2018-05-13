class HomeController < ApplicationController
  def index
    @environments = Environment.all.includes(:booked_environments).order(:created_at)
  end
end
