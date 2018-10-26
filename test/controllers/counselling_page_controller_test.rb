require 'test_helper'

class CounsellingPageControllerTest < ActionDispatch::IntegrationTest

  test "should show counselling_page" do
    assert_gets counselling_page_path
  end

  test "should get edit" do
    assert_gets edit_counselling_page_url, login_required: true
  end

  test "should update counselling_page" do
    assert_updates counselling_page_url, page_params(:counselling_page), xhr: false, login_required: true
  end

  test "should update counselling_page via xhr" do
    assert_updates counselling_page_url, page_params(:counselling_page), xhr: true, login_required: true
  end

  test "should not update counselling_page if form contains errors" do
    refute_updates counselling_page_url, page_params(:counselling_page, body: '', size: 21.megabytes), xhr: false, login_required: true
  end

  test "should not update counselling_page via xhr if form contains errors" do
    refute_updates counselling_page_url, page_params(:counselling_page, body: '', size: 21.megabytes), xhr: true, login_required: true
  end
end
