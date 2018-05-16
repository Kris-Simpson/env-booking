class Booking < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :environment
  belongs_to :user

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_create :set_until_field

  scope :finished, -> { where.not(until: Time.current..DateTime::Infinity.new).order(:created_at) }
  scope :in_progress, -> { where(until: Time.current..DateTime::Infinity.new).order(:created_at) }
  scope :future, -> { in_progress.where.not(id: current&.id).order(:created_at) }

  def self.current
    in_progress.first
  end

  private

  def set_until_field
    from = self.class.last&.until || Time.current

    self.until = from + duration.minutes
  end
end
