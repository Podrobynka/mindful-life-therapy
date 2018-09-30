require 'test_helper'

class AboutPageControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_page = about_pages(:one)
  end

  test "should show about_page" do
    get about_page_url
    assert_response :success
  end

  test "should get edit" do
    get edit_about_page_url
    assert_response :success
  end

  test "should update about_page" do
    patch about_page_url, params: { about_page: { body: @about_page.body, meta_description: @about_page.meta_description, title: @about_page.title } }
    assert_redirected_to about_page_url
  end
end
