require 'test_helper'

class CounsellingPageTest < ActiveSupport::TestCase

  setup do
    @counselling_page = counselling_pages(:one)
  end

  test 'body' do
    assert_required @counselling_page, :body
    assert_too_long @counselling_page, :body, 100001
    assert_valid_length @counselling_page, :body, 100000
  end

  test 'has one attached photo' do
    assert_has_one_attached_photo @counselling_page
  end

  test 'photo size' do
    assert_too_big @counselling_page, photo_fixture, 21.megabytes
    assert_valid_size @counselling_page, photo_fixture, 20.megabytes
    assert_allowed_size @counselling_page, photo_fixture, 20.megabytes
  end

  test 'photo content_type' do
    assert_wrong_format @counselling_page, :photo, pdf_fixture
    assert_valid_format @counselling_page, :photo, photo_fixture
    assert_allowed_content_types @counselling_page, :photo, content_types_fixture
  end

  test 'display_photo' do
    assert_display_photo_defaults_to_fallback_photo @counselling_page, fallback_photos[:counselling_page]
    assert_display_photo_returns_stored_photo_if_it_exists @counselling_page, photo_fixture
  end

  test "photo_title" do
    expected = "Counselling and Psychotherapy in Glasgow"
    assert_photo_title @counselling_page, expected
  end

  test "photo_variant_size" do
    assert_photo_variant_size @counselling_page, '608'
  end

  test "valid record" do
    counselling_page = CounsellingPage.create body: 'a' * 100000
    attach_file_to counselling_page, photo_fixture
    assert counselling_page.valid?
  end
end
