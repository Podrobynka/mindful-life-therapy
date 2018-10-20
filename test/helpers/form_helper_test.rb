require 'test_helper'

class FormHelperTest < ActionView::TestCase

  test 'button_css returns string and with default color if no argument is provided' do
    expected = "button strong success"
    assert_equal expected, button_css
  end

  test 'button_css argument changes the default color' do
    expected = "button strong primary"
    assert_equal expected, button_css(color: 'primary')
  end

  test 'form_button_css returns a string' do
    expected = "button strong success large"
    assert_equal expected, form_button_css
  end

  test 'form_title_for' do
    expected = "<h1 class='page--title'>Edit the About Page</h1>"
    actual = form_title_for about_pages(:one)
    assert_dom_equal expected, actual
  end

  test 'help_text returns a paragrph with text' do
    tag = "<p class='form--help-text'>100 characters max</p>"
    assert_dom_equal tag, help_text('100 characters max')
  end

  test 'error_message returns a div with css classes and a data attribute' do
    tag = "<div class='error-message hide' data-target='hello.boom'></div>"
    assert_dom_equal tag, error_message(target: 'hello.boom')
  end

  test 'error_message automatically sets data-target if not provided' do
    tag = "<div class='error-message hide' data-target='errors.message'></div>"
    assert_dom_equal tag, error_message
  end
end
