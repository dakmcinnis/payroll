require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @employee1 = users(:employee1)
    sign_in @employee1
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get user" do
    get users_url(@employee1.id)
    assert_response :success
  end
end
