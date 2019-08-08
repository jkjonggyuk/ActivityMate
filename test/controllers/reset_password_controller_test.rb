require 'test_helper'

class ResetPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reset_password_new_url
    assert_response :success
  end

  test "should get create" do
    get reset_password_create_url
    assert_response :success
  end

end
