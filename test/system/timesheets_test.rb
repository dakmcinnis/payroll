require "application_system_test_case"

class TimesheetsTest < ApplicationSystemTestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "visiting the index" do
    visit timesheets_url
    assert_selector "h1", text: "Timesheets"
  end

  test "should create timesheet" do
    visit timesheets_url
    click_on "New timesheet"

    fill_in "Pay period", with: @timesheet.pay_period_id
    fill_in "User", with: @timesheet.user_id
    click_on "Create Timesheet"

    assert_text "Timesheet was successfully created"
    click_on "Back"
  end

  test "should update Timesheet" do
    visit timesheet_url(@timesheet)
    click_on "Edit this timesheet", match: :first

    fill_in "Pay period", with: @timesheet.pay_period_id
    fill_in "User", with: @timesheet.user_id
    click_on "Update Timesheet"

    assert_text "Timesheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Timesheet" do
    visit timesheet_url(@timesheet)
    click_on "Destroy this timesheet", match: :first

    assert_text "Timesheet was successfully destroyed"
  end
end
