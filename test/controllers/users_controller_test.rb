require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get user" do
    get users_url(@user.id)
    assert_response :success
  end
end
