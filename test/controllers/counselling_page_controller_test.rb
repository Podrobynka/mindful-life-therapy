require 'test_helper'

class CounsellingPageControllerTest < ActionDispatch::IntegrationTest

  test "should show counselling_page" do
    get counselling_page_url
    assert_response :success
  end

  test "should get edit" do
    get edit_counselling_page_url
    assert_response :success
  end

  test "should update counselling_page" do
    patch counselling_page_url, params: { counselling_page: { body: counselling_pages(:one).body } }
    assert_redirected_to counselling_page_url
  end

  test "should update counselling_page via :xhr" do
    patch counselling_page_url, xhr: true, params: { counselling_page: { body: counselling_pages(:one).body } }
    assert_match 'Turbolinks.visit("http://www.example.com/counselling-and-psychotherapy-in-glasgow", {"action":"replace"})', response.body
  end

  test "should show error message when update fails" do
    patch counselling_page_url, params: { counselling_page: { body: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end

  test "should show error message when update via :xhr fails" do
    patch counselling_page_url, xhr: true, params: { counselling_page: { body: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end
end
