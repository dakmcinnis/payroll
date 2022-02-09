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
end