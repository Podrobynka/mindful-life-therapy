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
    patch about_page_url, params: { about_page: { body: about_pages(:one).body, page_photo: photo_fixture } }
    assert_redirected_to about_page_url
  end

  test "should update about_page via :xhr" do
    patch about_page_url, xhr: true, params: { about_page: { body: about_pages(:one).body, page_photo: photo_fixture } }
    assert_match 'Turbolinks.visit("http://www.example.com/about-mindful-life-therapy", {"action":"replace"})', response.body
  end

  test "should show error message when update fails" do
    patch about_page_url, params: { about_page: { body: '', page_photo: photo_fixture } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end

  test "should show error message when update via :xhr fails" do
    page_photo = fixture_file_upload(photo_fixture, 'image/png')
    patch about_page_url, xhr: true, params: { about_page: { body: '', page_photo: photo_fixture } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end
end
