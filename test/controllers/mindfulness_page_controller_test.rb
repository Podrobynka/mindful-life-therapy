require 'test_helper'

class MindfulnessPageControllerTest < ActionDispatch::IntegrationTest

  test "should show mindfulness_page" do
    assert_gets mindfulness_page_path
  end

  test "should get edit" do
    assert_gets edit_mindfulness_page_url, login_required: true
  end

  test "should update mindfulness_page" do
    assert_updates mindfulness_page_url, page_params(:mindfulness_page), xhr: false, login_required: true
  end

  test "should update mindfulness_page via xhr" do
    assert_updates mindfulness_page_url, page_params(:mindfulness_page), xhr: true, login_required: true
  end

  test "should not update mindfulness_page if form contains errors" do
    refute_updates mindfulness_page_url, page_params(:mindfulness_page, body: '', size: 21.megabytes), xhr: false, login_required: true
  end

  test "should not update mindfulness_page via xhr if form contains errors" do
    refute_updates mindfulness_page_url, page_params(:mindfulness_page, body: '', size: 21.megabytes), xhr: true, login_required: true
  end
end
