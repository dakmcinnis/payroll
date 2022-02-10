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
  validates_with UniqueValidator
end
