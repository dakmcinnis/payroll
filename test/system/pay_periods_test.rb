require "application_system_test_case"

class PayPeriodsTest < ApplicationSystemTestCase
  setup do
    @pay_period = pay_periods(:jan3inactive)
  end

  test "visiting the index" do
    visit pay_periods_url
    assert_selector "h1", text: "Pay periods"
  end

  test "should create pay period" do
    visit pay_periods_url
    click_on "New pay period"

    check "Active" if @pay_period.active
    fill_in "Call", with: @pay_period.call
    fill_in "End", with: @pay_period.end
    fill_in "Start", with: @pay_period.start
    click_on "Create Pay period"

    assert_text "Pay period was successfully created"
    click_on "Back"
  end

  test "should update Pay period" do
    visit pay_period_url(@pay_period)
    click_on "Edit this pay period", match: :first

    check "Active" if @pay_period.active
    fill_in "Call", with: @pay_period.call
    fill_in "End", with: @pay_period.end
    fill_in "Start", with: @pay_period.start
    click_on "Update Pay period"

    assert_text "Pay period was successfully updated"
    click_on "Back"
  end

  test "should destroy Pay period" do
    visit pay_period_url(@pay_period)
    click_on "Destroy this pay period", match: :first

    assert_text "Pay period was successfully destroyed"
  end
end
