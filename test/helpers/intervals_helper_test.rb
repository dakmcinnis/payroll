require "test_helper"

class IntervalsHelperTest < ActionView::TestCase

  # For format_time

  test "format_time at midnight" do
    expected = "12:00 AM"
    actual = format_time(Time.new(2011, 10, 31))

    assert_equal expected, actual
  end

  test "format_time at 3:45am" do
    expected = "3:45 AM"
    actual = format_time(Time.new(2011, 10, 31, 3, 45, 01))

    assert_equal expected, actual
  end

  test "format_time at noon" do
    expected = "12:00 PM"
    actual = format_time(Time.new(2011, 10, 31, 12))

    assert_equal expected, actual
  end

  test "format_time at 11:59:59pm" do
    expected = "11:59 PM"
    actual = format_time(Time.new(2011, 10, 31, 23, 59, 59))

    assert_equal expected, actual
  end
end
