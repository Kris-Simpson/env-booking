class BookedEnvironment < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :environment
  belongs_to :user

  validates :from, presence: true
  validates :to, presence: true

  validates_with TimeRangeValidator

  validate :time_overlap, on: :create

  private

  def time_overlap
    booking_time_ranges = self.class.where(environment: environment).select(:from, :to)
    time_ranges = booking_time_ranges.map { |record| record.from..(record.to - 1.minute) }

    errors.add(:from, "can't overlap existing bookings") if time_ranges.any? { |range| range === from }
    errors.add(:to, "can't overlap existing bookings") if time_ranges.any? { |range| range === to }
  end
end
