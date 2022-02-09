class PayPeriod < ApplicationRecord
    validates :start, presence: true
    validates :end, presence: true
    validates :call, presence: true
    after_initialize :default_values

    private

    def default_values
        self.active = true if self.active.nil?
    end
end
