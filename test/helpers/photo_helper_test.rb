require 'test_helper'

class PhotoHelperTest < ActionView::TestCase

  test 'photo_for defaults to fallback_photo' do
    record = about_pages(:one)
    expected = "<img title='Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor' alt='Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor' class='border-radius' src='/images/about/zoe-zalavary-glasgow-counsellor-psychotherapist-mindful-life-therapy.jpg' />"
    assert_dom_equal expected, photo_for(record)
  end

  test 'photo_for returns stored_photo if it exists' do
    record = about_pages(:one)
    attach_file_to record, photo_fixture
    expected = "http://test.host/rails/active_storage/representations"
    assert_match expected, photo_for(record)
  end
end
