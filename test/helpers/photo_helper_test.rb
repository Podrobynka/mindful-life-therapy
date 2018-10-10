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
    expected = /(<img title=\"Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor\" alt=\"Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor\" class=\"border-radius\" src=\"http:\/\/test\.host\/rails\/active_storage\/representations\/.*\/logo\.png\" \/>)/
    actual = photo_for(record)
    assert_match expected, actual
  end

  test 'file_upload_preview_photo_for defaults to fallback_photo and appends data-target and data-original-photo' do
    record = about_pages(:one)
    expected = '<img title="Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor" alt="Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor" class="border-radius" data-target="file-upload-preview.filePreviewImage" data-original-photo="/images/about/zoe-zalavary-glasgow-counsellor-psychotherapist-mindful-life-therapy.jpg" src="/images/about/zoe-zalavary-glasgow-counsellor-psychotherapist-mindful-life-therapy.jpg" />'
    actual = file_upload_preview_photo_for(record: record, data_target: 'file-upload-preview.filePreviewImage')
    assert_dom_equal expected, actual
  end

  test 'file_upload_preview_photo_for returns stored_photo if it exists and appends data-target and data-original-photo' do
    record = about_pages(:one)
    attach_file_to record, photo_fixture
    expected = /(<img title=\"Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor\" alt=\"Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor\" class=\"border-radius\" data-target=\"file-upload-preview.filePreviewImage\" data-original-photo=\"http:\/\/test\.host\/rails\/active_storage\/representations\/.*\/logo\.png\" src=\"http:\/\/test\.host\/rails\/active_storage\/representations\/.*\/logo\.png\" \/>)/
    actual = file_upload_preview_photo_for(record: record, data_target: 'file-upload-preview.filePreviewImage')
    assert_match expected, actual
  end

  test 'original_photo_for defaults to fallback_photo' do
    record = about_pages(:one)
    expected = '/images/about/zoe-zalavary-glasgow-counsellor-psychotherapist-mindful-life-therapy.jpg'
    actual = original_photo_for(record)
    assert_dom_equal expected, actual
  end

  test 'original_photo_for returns path to stored photo if it exists' do
    record = about_pages(:one)
    attach_file_to record, photo_fixture
    expected = /(http:\/\/test\.host\/rails\/active_storage\/representations\/.*\/logo\.png)/
    actual = original_photo_for(record)
    assert_match expected, actual
  end
end
