require 'test_helper'

class AboutPageControllerTest < ActionDispatch::IntegrationTest

  test "should show about_page" do
    assert_gets about_page_path
  end

  test "should get edit" do
    assert_gets edit_about_page_url, login_required: true
  end

  test "should update about_page" do
    assert_updates about_page_url, page_params(:about_page), xhr: false, login_required: true
  end

  test "should update about_page via xhr" do
    assert_updates about_page_url, page_params(:about_page), xhr: true, login_required: true
  end

  test "should not update about_page if form contains errors" do
    refute_updates about_page_url, page_params(:about_page, body: '', size: 21.megabytes), xhr: false, login_required: true
  end

  test "should not update about_page via xhr if form contains errors" do
    refute_updates about_page_url, page_params(:about_page, body: '', size: 21.megabytes), xhr: true, login_required: true
  end
end
