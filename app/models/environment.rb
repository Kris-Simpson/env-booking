class Environment < ApplicationRecord
  enum state: %i(free booked)

  has_many :booked_environments, dependent: :destroy

  validates :name, presence: true

  def current_booking
    booked_environments.first
  end
end
