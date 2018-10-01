require 'test_helper'

class SettingsHelperTest < ActionView::TestCase

  test 'office_address returns a list with company name as first item' do
    blank_fixture = {}
    expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li></ul>"
    assert_dom_equal expected, office_address(blank_fixture)
  end

  test 'office_address extracts address details from provided argument' do
    fixture = {
      office_address_line_1: 'Awesome House',
      office_address_line_2: 'Apartment 95',
      office_address_line_3: 'Cool Street',
      office_address_city: 'Amazing City',
      office_address_postcode: 'G1 1AA'
    }

    expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li><li>Awesome House</li><li>Apartment 95</li><li>Cool Street</li><li>Amazing City</li><li>G1 1AA</li></ul>"
    assert_dom_equal expected, office_address(fixture)
  end

  test 'office_address rejects blank values from provided argument' do
    fixture = {
      office_address_line_1: 'Awesome House',
      office_address_line_2: '',
      office_address_line_3: nil,
      office_address_city: 'Amazing City',
      office_address_postcode: 'G1 1AA'
    }

    expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li><li>Awesome House</li><li>Amazing City</li><li>G1 1AA</li></ul>"
    assert_dom_equal expected, office_address(fixture)
  end

  # test 'office_address extracts address details from provided argument' do
  #   fixture = { office_address_line_1: '123 Awesome Street' }
  #   expected = "<ul class='no-bullet'><li>Mindful Life Therapy</li><li>123 Awesome Street</li></ul>"
  #   assert_dom_equal expected, office_address(fixture)
  # end

  test 'footer_office_address returns a string of comma separated values' do
    fixture = {
      office_address_line_1: 'Awesome House',
      office_address_line_2: 'Apartment 95',
      office_address_line_3: 'Cool Street',
      office_address_city: 'Amazing City',
      office_address_postcode: 'G1 1AA'
    }

    expected = 'Awesome House, Apartment 95, Cool Street, Amazing City, G1 1AA'
    assert_equal expected, footer_office_address(fixture)
  end

  test 'footer_office_address rejects blank values' do
    fixture = {
      office_address_line_1: 'Awesome House',
      office_address_line_2: '',
      office_address_line_3: nil,
      office_address_city: 'Amazing City',
      office_address_postcode: 'G1 1AA'
    }

    expected = 'Awesome House, Amazing City, G1 1AA'
    assert_equal expected, footer_office_address(fixture)
  end
end
