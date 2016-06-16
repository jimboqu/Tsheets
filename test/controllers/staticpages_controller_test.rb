require 'test_helper'

class StaticpagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get do" do
    get :do
    assert_response :success
  end

end
