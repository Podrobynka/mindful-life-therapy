require 'test_helper'

class AboutPageTest < ActiveSupport::TestCase

  setup do
    @about_page = about_pages(:one)
  end

  test 'body' do
    assert_required @about_page, :body
    assert_too_long @about_page, :body, 100001
    assert_valid_length @about_page, :body, 100000
  end

  test 'has one attached photo' do
    assert_has_one_attached_photo @about_page
  end

  test 'photo size' do
    assert_too_big @about_page, photo_fixture, 21.megabytes
    assert_valid_size @about_page, photo_fixture, 20.megabytes
    assert_allowed_size @about_page, photo_fixture, 20.megabytes
  end

  test 'photo content_type' do
    assert_wrong_format @about_page, :photo, pdf_fixture
    assert_valid_format @about_page, :photo, photo_fixture
    assert_allowed_content_types @about_page, :photo, content_types_fixture
  end

  test 'display_photo' do
    assert_display_photo_defaults_to_fallback_photo @about_page, fallback_photos[:about_page]
    assert_display_photo_returns_stored_photo_if_it_exists @about_page, photo_fixture
  end

  test "photo_title" do
    expected = "Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor"
    assert_photo_title @about_page, expected
  end

  test "photo_variant_size" do
    assert_photo_variant_size @about_page, '210'
  end

  test "valid record" do
    about_page = AboutPage.create body: 'a' * 100000
    attach_file_to about_page, photo_fixture
    assert about_page.valid?
  end
end
