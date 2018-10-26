require 'test_helper'

class MapControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    assert_gets map_page_url
  end
end
