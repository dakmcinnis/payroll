# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_10_210727) do

  create_table "intervals", force: :cascade do |t|
    t.date "date"
    t.time "time_in"
    t.time "time_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "timesheet_id", null: false
    t.index ["timesheet_id"], name: "index_intervals_on_timesheet_id"
  end

  create_table "pay_periods", force: :cascade do |t|
    t.boolean "active"
    t.date "start"
    t.date "end"
    t.date "call"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "pay_period_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pay_period_id"], name: "index_timesheets_on_pay_period_id"
    t.index ["user_id"], name: "index_timesheets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "preferred_name"
    t.string "last_name"
    t.string "pronouns"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "intervals", "timesheets"
  add_foreign_key "timesheets", "pay_periods"
  add_foreign_key "timesheets", "users"
end
