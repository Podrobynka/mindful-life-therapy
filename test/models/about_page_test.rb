require 'test_helper'

class AboutPageTest < ActiveSupport::TestCase

  test 'valid about page' do
    attrs = {
      body: 'a' * 100000
    }

    about_page = AboutPage.create attrs
    assert about_page.valid?
  end

  test 'body is required' do
    about_page = AboutPage.create
    assert_match /blank/, about_page.errors[:body].to_s
  end

  test 'body has max length' do
    about_page = AboutPage.create body: 'a' * 100001
    assert_match /too long/, about_page.errors[:body].to_s
  end

  test 'page_photo has max size' do
  end

  test 'page_photo type is restricted' do
    about_page = about_pages(:one)
    about_page.page_photo.attach(io: File.open(pdf_fixture), filename: 'test.pdf')

    refute about_page.valid?
    refute about_page.page_photo.attached?
    assert_match /is the wrong format/, about_page.errors[:page_photo].to_s
  end

  test 'display_photo returns page_photo if it exists' do
  end

  test 'display_photo defaults to fallback' do
    fallback = 'about/zoe-zalavary-psychotherapist-mindful-life-therapy-glasgow.jpg'
    assert_equal fallback, about_pages(:one).display_photo
  end

  test "variant_size" do
    assert_equal "210", about_pages(:one).variant_size
  end
end
