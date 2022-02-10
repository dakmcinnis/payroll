require "test_helper"

# TODO: Fix with fixture stuff
# Was working at commit 8126491

class IntervalTest < ActiveSupport::TestCase
  # setup do
  #   @user = 1
  #   @pay_period = 2
  #   @date = Date.new(2022, 01, 02)
  #   # Note: Below, we use Jan 1 2000, since this is the side effect of using Time with Rails + PSQL
  #   @eight_am = Date.new(2000, 01, 01) + 8.hours
  #   @twelve_pm = Date.new(2000, 01, 01) + 12.hours
  # end

  # # New

  # test "For new interval, no default values" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.new()
  #   end

  #   assert interval
  #   assert_nil interval.user
  #   assert_nil interval.pay_period
  #   assert_nil interval.date
  #   assert_nil interval.time_in
  #   assert_nil interval.time_out
  # end

  # # Create

  # test "Create interval successfully" do
  #   interval = nil

  #   assert_difference "Interval.count", 1 do
  #     interval = Interval.create(
  #       user: @user,
  #       pay_period: @pay_period,
  #       date: @date,
  #       time_in: @eight_am,
  #       time_out: @twelve_pm,
  #     )
  #   end

  #   assert interval
  #   assert_equal @user, interval.user
  #   assert_equal @pay_period, interval.pay_period
  #   assert_equal @date, interval.date
  #   assert_equal @eight_am, interval.time_in
  #   assert_equal @twelve_pm, interval.time_out
  # end

  # test "No creation or save if no user" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       pay_period: @pay_period,
  #       date: @date,
  #       time_in: @eight_am,
  #       time_out: @twelve_pm,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # test "No creation or save if no pay period" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       user: @user,
  #       date: @date,
  #       time_in: @eight_am,
  #       time_out: @twelve_pm,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # test "No creation or save if no date" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       user: @user,
  #       pay_period: @pay_period,
  #       time_in: @eight_am,
  #       time_out: @twelve_pm,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # test "No creation or save if no time in" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       user: @user,
  #       pay_period: @pay_period,
  #       date: @date,
  #       time_out: @twelve_pm,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # test "No creation or save if no time out" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       user: @user,
  #       pay_period: @pay_period,
  #       date: @date,
  #       time_in: @eight_am,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # test "No creation or save if time out before time in" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       user: @user,
  #       pay_period: @pay_period,
  #       date: @date,
  #       time_in: @twelve_pm,
  #       time_out: @eight_am,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # test "No creation or save if time out is time in" do
  #   interval = nil

  #   assert_no_difference "Interval.count" do
  #     interval = Interval.create(
  #       user: @user,
  #       pay_period: @pay_period,
  #       date: @date,
  #       time_in: @eight_am,
  #       time_out: @eight_am,
  #     )
  #   end

  #   assert_no_difference "Interval.count" do
  #     interval.save
  #   end
  # end

  # # Update

  # test "Successful update" do
  #   interval = intervals(:jan3morning)
  #   new_time_in = @eight_am

  #   interval.update(time_in: @eight_am)

  #   updated_interval = Interval.find(interval.id)
  #   assert_equal new_time_in, updated_interval.time_in
  # end

  # test "No update if no user" do
  #   interval = intervals(:jan3morning)
  #   new_user = nil
  #   new_pay_period = 2

  #   interval.update(user: new_user, pay_period: new_pay_period)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_user, updated_interval.user
  #   assert_not_equal new_pay_period, updated_interval.pay_period
  # end

  # test "No update if no pay period" do
  #   interval = intervals(:jan3morning)
  #   new_user = 2
  #   new_pay_period = nil

  #   interval.update(user: new_user, pay_period: new_pay_period)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_user, updated_interval.user
  #   assert_not_equal new_pay_period, updated_interval.pay_period
  # end

  # test "No update if no date" do
  #   interval = intervals(:jan3morning)
  #   new_date = nil
  #   new_time_in = @eight_am
  #   new_time_out = @twelve_pm

  #   interval.update(date: new_date, time_in: new_time_in, time_out: new_time_out)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_date, updated_interval.date
  #   assert_not_equal new_time_in, updated_interval.time_in
  #   assert_not_equal new_time_out, updated_interval.time_out
  # end

  # test "No update if no time_in" do
  #   interval = intervals(:jan3morning)
  #   new_date = @date
  #   new_time_in = nil
  #   new_time_out = @twelve_pm

  #   interval.update(date: new_date, time_in: new_time_in, time_out: new_time_out)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_date, updated_interval.date
  #   assert_not_equal new_time_in, updated_interval.time_in
  #   assert_not_equal new_time_out, updated_interval.time_out
  # end

  # test "No update if no time out" do
  #   interval = intervals(:jan3morning)
  #   new_date = @date
  #   new_time_in = @eight_am
  #   new_time_out = nil

  #   interval.update(date: new_date, time_in: new_time_in, time_out: new_time_out)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_date, updated_interval.date
  #   assert_not_equal new_time_in, updated_interval.time_in
  #   assert_not_equal new_time_out, updated_interval.time_out
  # end

  # test "No update if time out before time in" do
  #   interval = intervals(:jan3morning)
  #   new_date = @date
  #   new_time_in = @twelve_pm
  #   new_time_out = @eight_am

  #   interval.update(date: new_date, time_in: new_time_in, time_out: new_time_out)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_date, updated_interval.date
  #   assert_not_equal new_time_in, updated_interval.time_in
  #   assert_not_equal new_time_out, updated_interval.time_out
  # end

  # test "No update if time out is time in" do
  #   interval = intervals(:jan3morning)
  #   new_date = nil
  #   new_time_in = @eight_am
  #   new_time_out = @eight_am

  #   interval.update(date: new_date, time_in: new_time_in, time_out: new_time_out)

  #   updated_interval = Interval.find(interval.id)
  #   assert_not_equal new_date, updated_interval.date
  #   assert_not_equal new_time_in, updated_interval.time_in
  #   assert_not_equal new_time_out, updated_interval.time_out
  # end
  
  # # Destroy

  # test "Destroy successfully" do
  #   interval = intervals(:jan3morning)

  #   assert Interval.exists?(interval.id)

  #   assert_difference "Interval.count", -1 do
  #     interval.destroy
  #   end

  #   refute Interval.exists?(interval.id)
  # end
end
