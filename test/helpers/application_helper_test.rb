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
end