require 'test_helper'

class OneControllerTest < ActionDispatch::IntegrationTest
  test "should get two" do
    get one_two_url
    assert_response :success
  end

  test "should get three" do
    get one_three_url
    assert_response :success
  end

end
