require 'test_helper'

class CounsellingPageTest < ActiveSupport::TestCase

  test 'valid counselling page' do
    attrs = {
      body: 'a' * 100000
    }

    counselling_page = CounsellingPage.create attrs
    assert counselling_page.valid?
  end

  test 'body is required' do
    counselling_page = CounsellingPage.create
    assert_match /blank/, counselling_page.errors[:body].to_s
  end

  test 'body has max length' do
    counselling_page = CounsellingPage.create body: 'a' * 100001
    assert_match /too long/, counselling_page.errors[:body].to_s
  end
end
