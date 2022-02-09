# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Users

admin = User.new
admin.admin = true
admin.first_name = "Dakota"
admin.last_name = "McInnis"
admin.pronouns = "they/them"
admin.email = ENV["SEED_ADMIN_EMAIL"]
admin.password = ENV["SEED_PASSWORD"]
admin.password_confirmation = ENV["SEED_PASSWORD"]
admin.save!

employee1 = User.new
employee1.email = "tammy@gmail.com"
employee1.first_name = "Taamannae"
employee1.preferred_name = "Tammy"
employee1.last_name = "Tagasa"
employee1.pronouns = "she/her"
employee1.password = ENV["SEED_PASSWORD"]
employee1.password_confirmation = ENV["SEED_PASSWORD"]
employee1.save!

employee2 = User.new
employee2.email = "joseph@gmail.com"
employee2.first_name = "Joseph"
employee2.last_name = "McKinney"
employee2.pronouns = "he/him"
employee2.password = ENV["SEED_PASSWORD"]
employee2.password_confirmation = ENV["SEED_PASSWORD"]
employee2.save!

# Pay Periods

PayPeriod.create(
    active: false,
    start: (Time.now - 4.weeks).to_date,
    end: (Time.now - 2.weeks - 1.day).to_date,
    call: (Time.now - 2.weeks).to_date
)

PayPeriod.create(
    active: false,
    start: (Time.now - 2.weeks).to_date,
    end: (Time.now - 1.day).to_date,
    call: (Time.now).to_date
)

PayPeriod.create(
    active: true,
    start: (Time.now).to_date,
    end: (Time.now + 2.weeks - 1.day).to_date,
    call: (Time.now + 2.weeks).to_date
)

# Time Intervals

users = User.all
pay_periods = PayPeriod.all

users.each do |user|
    pay_periods.each do |pay_period|
        i = 0
        for i in (0..13)
            date = pay_period.start + i.days
            next if date.saturday? || date.sunday?
            Interval.create(
                user: user.id,
                pay_period: pay_period.id,
                date: date,
                time_in: date + 8.hours,
                time_out: date + 12.hours
            )
            Interval.create(
                user: user.id,
                pay_period: pay_period.id,
                date: date,
                time_in: date + 13.hours,
                time_out: date + 17.hours
            )
        end
    end
end
