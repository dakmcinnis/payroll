class PayPeriod < ApplicationRecord
    validates :start, presence: true
    validates :end, presence: true
    validates :call, presence: true
    after_initialize :default_values
    has_many :timesheets

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
