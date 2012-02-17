require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get signin" do
    get :signin
    assert_response :success
  end

  test "should get signout" do
    get :signout
    assert_response :success
  end

end
