require 'test_helper'

class MapHelperTest < ActionView::TestCase

  test 'office_map returns a div with lat and long as data attributes' do
    settings = Setting.first
    expected = "<div id='map' data-latitude='12345.6789' data-longitude='12345.6789'></div>"
    assert_dom_equal expected, office_map(settings)
  end

  test 'office_map takes optional css_class argument' do
    settings = Setting.first
    expected = "<div id='map' class='sidebar--map xmb' data-latitude='12345.6789' data-longitude='12345.6789'></div>"
    assert_dom_equal expected, office_map(settings, 'sidebar--map xmb')
  end
end
