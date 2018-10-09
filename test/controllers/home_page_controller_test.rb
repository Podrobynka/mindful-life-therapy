require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest

  test "should get root_url" do
    assert_gets root_url
  end

  test "root should route to show action" do
    assert_routing '/', controller: 'home_page', action: 'show'
  end
end
