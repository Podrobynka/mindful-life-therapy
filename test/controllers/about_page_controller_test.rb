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
    file = fixture_file_upload('files/logo.png', 'image/png')
    ActiveStorage::Blob.any_instance.stubs(:byte_size).returns(20.megabytes)

    assert_difference ['ActiveStorage::Blob.count', 'ActiveStorage::Attachment.count'] do
      patch about_page_url, params: { about_page: { body: about_pages(:one).body, page_photo: file } }
    end

    assert_redirected_to about_page_url
  end

  test "should update about_page via :xhr" do
    file = fixture_file_upload('files/logo.png', 'image/png')
    ActiveStorage::Blob.any_instance.stubs(:byte_size).returns(20.megabytes)

    assert_difference ['ActiveStorage::Blob.count', 'ActiveStorage::Attachment.count'] do
      patch about_page_url, xhr: true, params: { about_page: { body: about_pages(:one).body, page_photo: fixture_file_upload('files/logo.png', 'image/png') } }
    end

    assert_match 'Turbolinks.visit("http://www.example.com/about-mindful-life-therapy", {"action":"replace"})', response.body
  end

  test "should show error message when update fails" do
    file = fixture_file_upload('files/logo.png', 'image/png')
    ActiveStorage::Blob.any_instance.stubs(:byte_size).returns(21.megabytes)

    assert_no_difference ['ActiveStorage::Blob.count', 'ActiveStorage::Attachment.count'] do
      patch about_page_url, params: { about_page: { body: '', page_photo: file } }
    end

    assert_match /2 errors prohibited this record from being saved/, response.body.to_s
    assert_match /is too big/, response.body.to_s
  end

  test "should show error message when update via :xhr fails" do
    # lets try a pdf this time
    file = fixture_file_upload('files/dummy.pdf', 'application/pdf')

    assert_no_difference ['ActiveStorage::Blob.count', 'ActiveStorage::Attachment.count'] do
      patch about_page_url, xhr: true, params: { about_page: { body: '', page_photo: file } }
    end

    assert_match /2 errors prohibited this record from being saved/, response.body.to_s
    assert_match /is the wrong format/, response.body.to_s
  end
end
