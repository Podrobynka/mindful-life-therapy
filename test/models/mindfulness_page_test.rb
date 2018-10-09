require 'test_helper'

class MindfulnessPageTest < ActiveSupport::TestCase

  setup do
    @mindfulness_page = mindfulness_pages(:one)
  end

  test 'body is required' do
    assert_body_is_required @mindfulness_page
  end

  test 'body has max length' do
    assert_body_has_max_length @mindfulness_page, 100001
  end

  test 'body with valid length' do
    assert_body_with_valid_length @mindfulness_page, 100000
  end

  test 'has one attached photo' do
    assert_has_one_attached_photo @mindfulness_page
  end

  test 'photo has restricted content_type' do
    assert_photo_has_restricted_content_type @mindfulness_page
  end

  test 'photo allowed_content_types' do
    content_types = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
    assert_allowed_photo_content_types @mindfulness_page, content_types
  end

  test 'photo has max size' do
    assert_photo_has_max_size @mindfulness_page, 21.megabytes
  end

  test 'photo with valid size' do
    assert_photo_with_valid_size @mindfulness_page, 20.megabytes
  end

  test 'allowed_photo_size' do
    assert_allowed_photo_size @mindfulness_page, 20.megabytes
  end

  test 'display_photo defaults to fallback_photo' do
    fallback = 'mindfulness/mindfulness-meditation.jpg'
    assert_display_photo_defaults_to_fallback_photo @mindfulness_page, fallback
  end

  test 'display_photo returns stored_photo if it exists' do
    assert_display_photo_returns_stored_photo_if_it_exists @mindfulness_page
  end

  test "photo_title" do
    expected = "Mindfulness in Glasgow"
    assert_photo_title @mindfulness_page, expected
  end

  test "photo_variant_size" do
    assert_photo_variant_size @mindfulness_page, '640'
  end
end
