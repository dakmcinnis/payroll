# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

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
