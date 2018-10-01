require 'test_helper'

class AboutPageTest < ActiveSupport::TestCase

  test 'valid about page' do
    attrs = {
      title: 'a' * 100,
      body: 'a' * 100000,
      meta_description: 'a' * 150
    }

    about_page = AboutPage.new attrs
    assert about_page.valid?
  end

  test 'title is required' do
    about_page = AboutPage.new
    refute about_page.valid?
    assert_match /blank/, about_page.errors[:title].to_s
  end

  test 'meta_description is required' do
    about_page = AboutPage.new
    refute about_page.valid?
    assert_match /blank/, about_page.errors[:meta_description].to_s
  end

  test 'body is required' do
    about_page = AboutPage.new
    refute about_page.valid?
    assert_match /blank/, about_page.errors[:body].to_s
  end

  test 'title has max length' do
    about_page = AboutPage.new title: 'a' * 101
    refute about_page.valid?
    assert_match /too long/, about_page.errors[:title].to_s
  end

  test 'meta_description has max length' do
    about_page = AboutPage.new meta_description: 'a' * 151
    refute about_page.valid?
    assert_match /too long/, about_page.errors[:meta_description].to_s
  end

  test 'body has max length' do
    about_page = AboutPage.new body: 'a' * 100001
    refute about_page.valid?
    assert_match /too long/, about_page.errors[:body].to_s
  end
end