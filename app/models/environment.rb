class Environment < ApplicationRecord
  enum state: %i(free booked)

  has_many :booked_environments, dependent: :destroy

  validates :name, presence: true

  def current_booking
    booked_environments.first
  end

  def status_message
    env = booked_environments.in_progress
                             .where('"from" < :current AND "to" > :current', current: Time.current)
                             .first

    if env
      "Booked by #{env.user.email} until #{env.to.localtime.strftime('%I:%M%P')}"
    else
      env = booked_environments.in_progress.where('"from" > :current', current: Time.current).first
      suffix = "until #{env.from.localtime.strftime('%I:%M%P')}" if env

      "Free #{suffix}"
    end
  end
end
