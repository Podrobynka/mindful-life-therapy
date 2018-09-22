require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should root to show action" do
    get root_url
    assert_response :success
    assert_routing '/', controller: 'home_page', action: 'show'
  end
end
