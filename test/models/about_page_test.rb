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
end
