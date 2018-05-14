class Environment < ApplicationRecord
  enum state: %i(free booked)

  has_many :bookings, dependent: :destroy

  validates :name, presence: true

  def status_message
    env = bookings.in_progress
                  .where('"from" < :current AND "to" > :current', current: Time.current)
                  .first

    if env
      "Booked by #{env.user.email} until #{env.to.strftime('%I:%M%P')}"
    else
      env = bookings.in_progress.where('"from" > :current', current: Time.current).first
      suffix = "until #{env.from.strftime('%I:%M%P')}" if env

      "Free #{suffix}"
    end
  end
end
