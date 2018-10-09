require 'test_helper'

class SettingsHelperTest < ActionView::TestCase

  test 'office_address returns a list with company name as first item' do
    blank_fixture = {}
    expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li></ul>"
    assert_dom_equal expected, office_address(blank_fixture)
  end

  test 'office_address extracts address details from provided argument' do
    expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li><li>Awesome House</li><li>Apartment 95</li><li>Cool Street</li><li>Amazing City</li><li>G1 1AA</li></ul>"
    assert_dom_equal expected, office_address(address_fixture)
  end

  test 'office_address rejects blank values from provided argument' do
    expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li><li>Awesome House</li><li>Amazing City</li><li>G1 1AA</li></ul>"
    assert_dom_equal expected, office_address(address_fixture_with_blanks)
  end

  test 'footer_office_address returns a string of comma separated values' do
    expected = 'Awesome House, Apartment 95, Cool Street, Amazing City, G1 1AA'
    assert_equal expected, footer_office_address(address_fixture)
  end

  test 'footer_office_address rejects blank values from provided argument' do
    expected = 'Awesome House, Amazing City, G1 1AA'
    assert_equal expected, footer_office_address(address_fixture_with_blanks)
  end
end
