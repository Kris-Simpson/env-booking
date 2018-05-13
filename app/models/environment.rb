class Environment < ApplicationRecord
  enum state: %i(free booked)

  has_many :booked_environments, dependent: :destroy

  validates :name, presence: true

  def current_booking
    booked_environments.first
  end

  def status_message
    envs = booked_environments.in_progress
                              .where('"from" < :current AND "to" > :current', current: Time.current)

    if envs.present?
      env = envs.first

      "Booked by #{env.user.email} until #{env.to.localtime.strftime('%I:%M%P')}"
    else
      env = booked_environments.in_progress.where('"from" > :current', current: Time.current).first

      if env
        "Free until #{env.from.localtime.strftime('%I:%M%P')}"
      else
        'Free'
      end
    end
  end
end
