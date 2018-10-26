require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    assert_gets login_url
  end

end
