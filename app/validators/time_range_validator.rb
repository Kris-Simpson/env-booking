class TimeRangeValidator < ActiveModel::Validator
  def validate(record)
    return if record.errors.present?
    record.errors.add(:from, "can't be greater than or equal to To") if record.from >= record.to
  end
end
