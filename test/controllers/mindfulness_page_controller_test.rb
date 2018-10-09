require 'test_helper'

class MindfulnessPageControllerTest < ActionDispatch::IntegrationTest

  test "should show mindfulness_page" do
    assert_gets mindfulness_page_url
  end

  test "should get edit" do
    assert_gets edit_mindfulness_page_url
  end

  test "should update mindfulness_page" do
    assert_updates_page :mindfulness_page
  end

  test "should update mindfulness_page via :xhr" do
    assert_updates_page_via_xhr :mindfulness_page
  end

  test "should show error message when update fails" do
    assert_update_fails :mindfulness_page
  end

  test "should show error message when update via :xhr fails" do
    assert_update_fails_via_xhr :mindfulness_page
  end
end
