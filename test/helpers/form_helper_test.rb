require 'test_helper'

class FormHelperTest < ActionView::TestCase

  test 'error_message returns a div with css classes and a data attribute' do
    tag = "<div class='error-message hide' data-target='hello.boom'></div>"
    assert_dom_equal tag, error_message(target: 'hello.boom')
  end

  test 'error_message automatically sets data-target if not provided' do
    tag = "<div class='error-message hide' data-target='errors.message'></div>"
    assert_dom_equal tag, error_message
  end
end
