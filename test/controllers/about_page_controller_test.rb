require 'test_helper'

class AboutPageControllerTest < ActionDispatch::IntegrationTest

  test "should show about_page" do
    assert_gets about_page_url
  end

  test "should get edit" do
    assert_gets edit_about_page_url
  end

  test "should update about_page" do
    assert_updates_page :about_page
  end

  test "should update about_page via :xhr" do
    assert_updates_page_via_xhr :about_page
  end

  test "should show error message when update fails" do
    assert_update_fails :about_page
  end

  test "should show error message when update via :xhr fails" do
    assert_update_fails_via_xhr :about_page
  end
end
