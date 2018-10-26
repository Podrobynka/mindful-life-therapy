require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    assert_gets admin_path, login_required: true
  end
end
