require 'test_helper'

class MindfulnessPageTest < ActiveSupport::TestCase

  setup do
    @mindfulness_page = mindfulness_pages(:one)
  end

  test 'body' do
    assert_required @mindfulness_page, :body
    assert_too_long @mindfulness_page, :body, 100001
    assert_valid_length @mindfulness_page, :body, 100000
  end

  test 'has one attached photo' do
    assert_has_one_attached_photo @mindfulness_page
  end

  test 'photo size' do
    assert_too_big @mindfulness_page, photo_fixture, 21.megabytes
    assert_valid_size @mindfulness_page, photo_fixture, 20.megabytes
    assert_allowed_size @mindfulness_page, photo_fixture, 20.megabytes
  end

  test 'photo content_type' do
    assert_wrong_format @mindfulness_page, :photo, pdf_fixture
    assert_valid_format @mindfulness_page, :photo, photo_fixture
    assert_allowed_content_types @mindfulness_page, :photo, content_types_fixture
  end

  test 'display_photo' do
    assert_display_photo_defaults_to_fallback_photo @mindfulness_page, fallback_photos[:mindfulness_page]
    assert_display_photo_returns_stored_photo_if_it_exists @mindfulness_page, photo_fixture
  end

  test "photo_title" do
    expected = "Mindfulness in Glasgow"
    assert_photo_title @mindfulness_page, expected
  end

  test "photo_variant_size" do
    assert_photo_variant_size @mindfulness_page, '608'
  end

  test "valid record" do
    mindfulness_page = MindfulnessPage.create body: 'a' * 100000
    attach_file_to mindfulness_page, photo_fixture
    assert mindfulness_page.valid?
  end
end
