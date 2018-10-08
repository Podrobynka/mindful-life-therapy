require 'test_helper'

class AboutPageTest < ActiveSupport::TestCase

  setup do
    @about_page = about_pages(:one)
  end

  test 'body is required' do
    @about_page.update body: ''
    assert_match /blank/, @about_page.errors[:body].to_s
  end

  test 'body has max length' do
    invalid_body = 'a' * 100001
    @about_page.update body: invalid_body
    assert_match /too long/, @about_page.errors[:body].to_s
  end

  test 'body with valid length' do
    valid_body = 'a' * 100000
    @about_page.update body: valid_body
    assert @about_page.valid?
  end

  test 'has one attached page_photo' do
    @about_page.page_photo.attach(io: File.open(photo_fixture), filename: 'logo.png')
    assert @about_page.valid?
    assert @about_page.page_photo.attached?
    assert_equal 'logo.png', @about_page.page_photo.filename.to_s
  end

  test 'page_photo has restricted content_type' do
    @about_page.page_photo.attach(io: File.open(pdf_fixture), filename: 'test.pdf')
    refute @about_page.valid?
    refute @about_page.page_photo.attached?
    assert_match /is the wrong format/, @about_page.errors[:page_photo].to_s
  end

  test 'page_photo allowed_content_types' do
    expected = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
    assert_equal expected.sort, AboutPage.allowed_content_types.sort
  end

  test 'page_photo has max size' do
    invalid_file = File.open(photo_fixture)
    invalid_file.stubs(:size).returns(21.megabytes)
    @about_page.page_photo.attach(io: invalid_file, filename: 'test.png')
    refute @about_page.valid?
    refute @about_page.page_photo.attached?
    assert_match /is too big/, @about_page.errors[:page_photo].to_s
  end

  test 'page_photo with valid size' do
    valid_file = File.open(photo_fixture)
    valid_file.stubs(:size).returns(20.megabytes)
    @about_page.page_photo.attach(io: valid_file, filename: 'test.png')
    assert @about_page.valid?
    assert @about_page.page_photo.attached?
    assert_empty @about_page.errors[:page_photo]
  end

  test 'page_photo allowed_size' do
    assert_equal 20.megabytes, AboutPage.allowed_size
  end

  test 'display_photo defaults to fallback_photo' do
    fallback = 'about/zoe-zalavary-psychotherapist-mindful-life-therapy-glasgow.jpeg'
    assert_equal fallback, @about_page.display_photo
    assert_equal fallback, @about_page.fallback_photo
  end

  test 'display_photo returns stored_photo if it exists' do
    @about_page.page_photo.attach(io: File.open(photo_fixture), filename: 'logo.png')
    assert_instance_of ActiveStorage::Variant, @about_page.display_photo
    assert_instance_of ActiveStorage::Variant, @about_page.stored_photo
  end

  test "photo_title" do
    expected = "Zoe Zalavary, Glasgow based Counsellor, Psychotherapist and Mindfulness Instructor"
    assert_equal expected, about_pages(:one).photo_title
  end

  test "variant_size" do
    assert_equal "210", about_pages(:one).variant_size
  end
end
