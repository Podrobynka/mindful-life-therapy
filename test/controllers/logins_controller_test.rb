require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get logins_url
    assert_response :success
  end

end
