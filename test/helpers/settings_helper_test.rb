require 'test_helper'

class SettingsHelperTest < ActionView::TestCase

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
      office_address_line_1: '10 Newton Place',
      office_address_line_2: '',
      office_address_line_3: nil,
      office_address_city: 'Glasgow',
      office_address_postcode: 'G7 9PR'
    }

    expected = '10 Newton Place, Glasgow, G7 9PR'
    assert_equal expected, footer_office_address(fixture)
  end
end
