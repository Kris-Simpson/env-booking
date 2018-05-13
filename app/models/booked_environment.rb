class BookedEnvironment < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :environment
  belongs_to :user

  validates :from, presence: true
  validates :to, presence: true

  validates_with TimeRangeValidator

  validate :time_overlap, on: :create

  scope :in_progress, -> { where(from: Time.current..DateTime::Infinity.new)
                          .or(where(to: Time.current..DateTime::Infinity.new)) }

  private

  def time_overlap
    booking_time_ranges = self.class.where(environment: environment).select(:from, :to)
    time_ranges = booking_time_ranges.map { |record| record.from..record.to }

    if time_ranges.any? { |range| range === (to - 1.second) or range === (from + 1.second) }
      errors.add(:time_range, "can't overlap existing bookings")
    end
  end
end
