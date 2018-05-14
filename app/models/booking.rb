class Booking < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :environment
  belongs_to :user

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_create :set_until_field

  scope :finished, -> { where.not(until: Time.current..DateTime::Infinity.new) }
  scope :in_progress, -> { where(until: Time.current..DateTime::Infinity.new) }
  scope :future, -> { in_progress.where.not(id: current&.id) }

  def self.current
    in_progress.first
  end

  private

  def set_until_field
    from = self.class.current&.until || Time.current

    self.until = from + duration.minutes
  end
end
