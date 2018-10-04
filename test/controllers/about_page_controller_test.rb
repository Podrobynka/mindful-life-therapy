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
    patch about_page_url, params: { about_page: { body: about_pages(:one).body } }
    assert_redirected_to about_page_url
  end

  test "should update about_page via :xhr" do
    patch about_page_url, xhr: true, params: { about_page: { body: about_pages(:one).body } }
    assert_match 'Turbolinks.visit("http://www.example.com/about", {"action":"replace"})', response.body
  end

  test "should show error message when update fails" do
    patch about_page_url, params: { about_page: { body: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end

  test "should show error message when update via :xhr fails" do
    patch about_page_url, xhr: true, params: { about_page: { body: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end
end
