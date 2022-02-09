class PayPeriod < ApplicationRecord
    after_initialize :default_values
    validates :start, presence: true
    validates :end, presence: true
    validates :call, presence: true

    private

    def default_values
        self.active ||= true
    end
end
