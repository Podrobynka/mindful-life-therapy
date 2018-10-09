require 'test_helper'

class CounsellingPageControllerTest < ActionDispatch::IntegrationTest

  test "should show counselling_page" do
    assert_gets counselling_page_url
  end

  test "should get edit" do
    assert_gets edit_counselling_page_url
  end

  test "should update counselling_page" do
    assert_updates_page :counselling_page
  end

  test "should update counselling_page via :xhr" do
    assert_updates_page_via_xhr :counselling_page
  end

  test "should show error message when update fails" do
    assert_update_fails :counselling_page
  end

  test "should show error message when update via :xhr fails" do
    assert_update_fails_via_xhr :counselling_page
  end
end
