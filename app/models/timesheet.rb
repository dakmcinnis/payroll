class UniqueValidator < ActiveModel::Validator
  def validate(record)
    return if record.user.nil? || record.pay_period.nil?
    results = Timesheet.where(user: record.user, pay_period: record.pay_period)
    if results.any?
        record.errors.add :base, "Cannot create a duplicate timesheet"
    end
  end
end

class Timesheet < ApplicationRecord
  belongs_to :user
  belongs_to :pay_period
  has_many :intervals, dependent: :destroy
  validates_with UniqueValidator

  def total_duration
    self.intervals.map(&:duration).inject(0, &:+)
  end
end
