require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  # For current_route?

  test "current_route? returns true when the test path is the request path" do
    controller.request.path = '/pay_periods'
    test_path = '/pay_periods'

    assert current_route?(controller.request, test_path)
  end

  test "current_route? returns true when the test path is a prefix to the request path" do
    controller.request.path = '/pay_periods/1'
    test_path = '/pay_periods'

    assert current_route?(controller.request, test_path)
  end

  test "current_route? returns false when the test path is prefixed by the request path" do
    controller.request.path = '/pay_periods'
    test_path = '/pay_periods/1'

    refute current_route?(controller.request, test_path)
  end

  # For format_date

  test "format_date for Dec 31st 1999" do
    expected = "Fri. Dec. 31, '99"
    actual = format_date(Date.new(1999, 12, 31))

    assert_equal expected, actual
  end

  test "format_date for Feb 8th 2022" do
    expected = "Tue. Feb. 8, '22"
    actual = format_date(Date.new(2022, 2, 8))

    assert_equal expected, actual
  end

  # For get_hours_from_duration

  test "Get 4h from 4h 1min duration" do
    expected = 4

    date = Date.new(2022, 2, 8)
    duration = (date + 8.hours + 1.minute) - (date + 4.hours)
    actual = get_hours_from_duration(duration)

    assert_equal expected, actual
  end

  # For get_minutes_from_duration

  test "Get 241 min from 4h 1min duration" do
    expected = 241

    date = Date.new(2022, 2, 8)
    duration = (date + 8.hours + 1.minute) - (date + 4.hours)
    actual = get_minutes_from_duration(duration)

    assert_equal expected, actual
  end

    # For get_remaining_minutes_from_duration

    test "Get remaining 1m from 4h 1min duration" do
      expected = 1
  
      date = Date.new(2022, 2, 8)
      duration = (date + 8.hours + 1.minute) - (date + 4.hours)
      actual = get_remaining_minutes_from_duration(duration)
  
      assert_equal expected, actual
    end

    # For format_duration

    test "Get duration formatted as 4h 1m" do
      expected = "4h 1m"
  
      date = Date.new(2022, 2, 8)
      duration = (date + 8.hours + 1.minute) - (date + 4.hours)
      actual = format_duration(duration)
  
      assert_equal expected, actual
    end
end