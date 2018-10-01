require 'test_helper'

class SeoHelperTest < ActionView::TestCase

  test 'title when page_title is set' do
    @view_flow = ActionView::OutputFlow.new
    @view_flow.set(:page_title, 'Hello')
    tag = '<title>Hello | Mindful Life Therapy</title>'
    assert_equal tag, title
  end

  test 'title when no page_title is set' do
    @view_flow = ActionView::OutputFlow.new
    tag = '<title>Mindful Life Therapy</title>'
    assert_equal tag, title
  end

  test 'meta_description returns meta description tag' do
    tag = "<meta name='description' content='hello' />"
    assert_dom_equal tag, meta_description('hello')
  end

  test 'meta_description returns nil if args are nil' do
    assert_nil meta_description(nil)
  end

  test 'meta_description returns nil if args are blank' do
    assert_nil meta_description('')
  end

  test 'canonical_link returns canonical link' do
    tag = "<link rel='canonical' href='https://blah.com' />"
    assert_dom_equal tag, canonical_link('https://blah.com')
  end

  test 'canonical_link returns nil if args are nil' do
    assert_nil canonical_link(nil)
  end

  test 'canonical_link returns nil if args are blank' do
    assert_nil canonical_link('')
  end

  test 'no_index returns robots no index tag' do
    tag = "<meta name='robots' content='noindex, follow' />"
    assert_dom_equal tag, no_index('any value will do here')
  end

  test 'no_index returns nil if args are nil' do
    assert_nil no_index(nil)
  end

  test 'no_index returns nil if args are blank' do
    assert_nil no_index('')
  end
end
