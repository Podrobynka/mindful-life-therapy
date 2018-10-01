require 'test_helper'

class NavBarHelperTest < ActionView::TestCase

  test 'active_link? returns active when the provided argument matches the current controller name' do
    stubs(:controller_name).returns('about_page')
    assert_equal 'active', active_link?('about_page')
  end

  test 'active_link? returns inactive when the provided argument does not match the current controller name' do
    stubs(:controller_name).returns('about_page')
    assert_equal 'inactive', active_link?('boom')
  end
end
