require "test_helper"

class PayPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_period = pay_periods(:one)
  end

  test "should get index" do
    get pay_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_period_url
    assert_response :success
  end

  test "should create pay_period" do
    assert_difference("PayPeriod.count") do
      post pay_periods_url, params: { pay_period: { active: @pay_period.active, call: @pay_period.call, end: @pay_period.end, start: @pay_period.start } }
    end

    assert_redirected_to pay_period_url(PayPeriod.last)
  end

  test "should show pay_period" do
    get pay_period_url(@pay_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_period_url(@pay_period)
    assert_response :success
  end

  test "should update pay_period" do
    patch pay_period_url(@pay_period), params: { pay_period: { active: @pay_period.active, call: @pay_period.call, end: @pay_period.end, start: @pay_period.start } }
    assert_redirected_to pay_period_url(@pay_period)
  end

  test "should destroy pay_period" do
    assert_difference("PayPeriod.count", -1) do
      delete pay_period_url(@pay_period)
    end

    assert_redirected_to pay_periods_url
  end
end
