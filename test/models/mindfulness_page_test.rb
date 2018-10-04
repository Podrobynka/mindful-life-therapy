require 'test_helper'

class MindfulnessPageTest < ActiveSupport::TestCase

  test 'valid mindfulness page' do
    attrs = {
      body: 'a' * 100000
    }

    mindfulness_page = MindfulnessPage.create attrs
    assert mindfulness_page.valid?
  end

  test 'body is required' do
    mindfulness_page = MindfulnessPage.create
    assert_match /blank/, mindfulness_page.errors[:body].to_s
  end

  test 'body has max length' do
    mindfulness_page = MindfulnessPage.create body: 'a' * 100001
    assert_match /too long/, mindfulness_page.errors[:body].to_s
  end
end
