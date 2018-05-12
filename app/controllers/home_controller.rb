class HomeController < ApplicationController
  def index
    @environments = Environment.all.includes(:booked_environments)
  end
end
