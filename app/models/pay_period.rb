class PayPeriodTimeValidator < ActiveModel::Validator
    def validate(record)
        return if record.start.nil? || record.end.nil? || record.call.nil?
        if record.start >= record.end
            record.errors.add :base, "'Start' must come before 'End'"
        end
        if record.end > record.call
            record.errors.add :base, "'End' must come before or on 'Call'"
        end
    end
end

class PayPeriod < ApplicationRecord
    validates :start, presence: true
    validates :end, presence: true
    validates :call, presence: true
    validates_with PayPeriodTimeValidator
    after_initialize :default_values
    has_many :timesheets, dependent: :destroy

    def display_name
        "##{self.id}: #{display_dates}"
    end

    def display_dates
        "#{ApplicationController.helpers.format_date(self.start)} - #{ApplicationController.helpers.format_date(self.end)}"
    end

    private

    def default_values
        self.active = true if self.active.nil?
    end
end
