require "test_helper"

class TimesheetTest < ActiveSupport::TestCase
  setup do
    @user = users(:employee1)
    @pay_period = pay_periods(:jan3inactive)
  end

  # New

  test "For new timesheet, no default values" do
    timesheet = nil

    assert_no_difference "Timesheet.count" do
      timesheet = Timesheet.new()
    end

    assert timesheet
    assert_nil timesheet.user_id
    assert_nil timesheet.pay_period_id
  end

  # Create

  test "Create timesheet successfully" do
    timesheet = nil

    assert_difference "Timesheet.count", 1 do
      timesheet = Timesheet.create(
        user_id: @user.id, pay_period_id: @pay_period.id
      )
    end

    assert timesheet
    assert_equal @user.id, timesheet.user_id
    assert_equal @pay_period.id, timesheet.pay_period_id
  end

  test "No creation or save if no user" do
    timesheet = nil

    assert_no_difference "Timesheet.count" do
      timesheet = Timesheet.create(
        pay_period_id: @pay_period.id
      )
    end

    assert_no_difference "Timesheet.count" do
      timesheet.save
    end
  end

  test "No creation or save if no pay period" do
    timesheet = nil

    assert_no_difference "Timesheet.count" do
      timesheet = Timesheet.create(
        user_id: @user.id
      )
    end

    assert_no_difference "Timesheet.count" do
      timesheet.save
    end
  end

  # TODO: No creation for non-existant foreign key
  # TODO: No creation for duplicate timesheet

  # Update

  # TODO

  # Destroy

  # TODO
end
