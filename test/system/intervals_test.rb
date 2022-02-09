require "application_system_test_case"

class IntervalsTest < ApplicationSystemTestCase
  setup do
    @interval = intervals(:one)
  end

  test "visiting the index" do
    visit intervals_url
    assert_selector "h1", text: "Intervals"
  end

  test "should create interval" do
    visit intervals_url
    click_on "New interval"

    fill_in "Date", with: @interval.date
    fill_in "Pay period", with: @interval.pay_period
    fill_in "Time in", with: @interval.time_in
    fill_in "Time out", with: @interval.time_out
    fill_in "User", with: @interval.user
    click_on "Create Interval"

    assert_text "Interval was successfully created"
    click_on "Back"
  end

  test "should update Interval" do
    visit interval_url(@interval)
    click_on "Edit this interval", match: :first

    fill_in "Date", with: @interval.date
    fill_in "Pay period", with: @interval.pay_period
    fill_in "Time in", with: @interval.time_in
    fill_in "Time out", with: @interval.time_out
    fill_in "User", with: @interval.user
    click_on "Update Interval"

    assert_text "Interval was successfully updated"
    click_on "Back"
  end

  test "should destroy Interval" do
    visit interval_url(@interval)
    click_on "Destroy this interval", match: :first

    assert_text "Interval was successfully destroyed"
  end
end
