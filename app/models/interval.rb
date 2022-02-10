class TimeValidator < ActiveModel::Validator
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
    validates_with TimeValidator

    # TODO: Consider adding other validations
    # - Pay period active (not recommended, because they make mistakes sometimes)
    # - Date within pay period
end
