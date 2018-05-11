class Environment < ApplicationRecord
  enum state: %i(free booked)

  has_one :booked_environment, dependent: :destroy

  validates :name, presence: true
end
