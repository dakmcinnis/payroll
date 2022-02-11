class IntervalDateValidator < ActiveModel::Validator
    def validate(record)
        return if record.date.nil?
        return if record.timesheet.nil?
        return if record.timesheet.pay_period.nil?
        pay_period = record.timesheet.pay_period
        if !record.date.between?(pay_period.start, pay_period.end)
            record.errors.add :base, "'Date' must be during pay period (#{ApplicationController.helpers.format_date(pay_period.start)} - #{ApplicationController.helpers.format_date(pay_period.end)})"
        end
    end
end

class IntervalTimeValidator < ActiveModel::Validator
    def validate(record)
        return if record.time_in.nil? || record.time_out.nil?
        if record.time_in >= record.time_out
            record.errors.add :base, "'Time in' must come before 'Time out'"
        end
    end
end

class Interval < ApplicationRecord
    belongs_to :timesheet
    validates :date, presence: true
    validates :time_in, presence: true
    validates :time_out, presence: true
    validates_with IntervalTimeValidator
    validates_with IntervalDateValidator

    # TODO: Consider adding other validations
    # - Pay period active (not recommended, because they make mistakes sometimes)
    # - Date within pay period

    def duration
        self.time_out - time_in
    end
end
