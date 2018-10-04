require 'test_helper'

class MindfulnessPageControllerTest < ActionDispatch::IntegrationTest

  test "should show mindfulness_page" do
    get mindfulness_page_url
    assert_response :success
  end

  test "should get edit" do
    get edit_mindfulness_page_url
    assert_response :success
  end

  test "should update mindfulness_page" do
    patch mindfulness_page_url, params: { mindfulness_page: { body: mindfulness_pages(:one).body } }
    assert_redirected_to mindfulness_page_url
  end

  test "should update mindfulness_page via :xhr" do
    patch mindfulness_page_url, xhr: true, params: { mindfulness_page: { body: mindfulness_pages(:one).body } }
    assert_match 'Turbolinks.visit("http://www.example.com/mindfulness-in-glasgow", {"action":"replace"})', response.body
  end

  test "should show error message when update fails" do
    patch mindfulness_page_url, params: { mindfulness_page: { body: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end

  test "should show error message when update via :xhr fails" do
    patch mindfulness_page_url, xhr: true, params: { mindfulness_page: { body: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end
end
