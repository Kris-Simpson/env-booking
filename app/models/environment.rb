class Environment < ApplicationRecord
  enum state: %i(free booked)

  has_many :booked_environments, dependent: :destroy

  validates :name, presence: true

  def current_booking
    booked_environments.first
  end

  def status_message
    if current_booking
      "Booked by #{current_booking.user.email}"
    else
      'Free'
    end
  end
end
