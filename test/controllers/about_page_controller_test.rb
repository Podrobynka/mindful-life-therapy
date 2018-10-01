require 'test_helper'

class AboutPageControllerTest < ActionDispatch::IntegrationTest

  test "should show about_page" do
    get about_page_url
    assert_response :success
  end

  test "should get edit" do
    get edit_about_page_url
    assert_response :success
  end

  test "should update about_page" do
    @about_page = about_pages(:one)
    patch about_page_url, params: { about_page: { body: @about_page.body, meta_description: @about_page.meta_description, title: @about_page.title } }
    assert_redirected_to about_page_url
  end

  test "should show error message when update fails" do
    @about_page = about_pages(:one)
    patch about_page_url, params: { about_page: { title: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end
end
