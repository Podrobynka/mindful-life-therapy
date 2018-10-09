require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  setup do
    @setting = settings(:one)
  end

  test "telephone" do
    assert_required @setting, :telephone
    assert_too_long @setting, :telephone, 31
    assert_valid_length @setting, :telephone, 30
  end

  test "contact_email" do
    assert_required @setting, :contact_email
    assert_too_long @setting, :contact_email, 51
    assert_valid_length @setting, :contact_email, 50
  end

  test "office_address_line_1" do
    assert_required @setting, :office_address_line_1
    assert_too_long @setting, :office_address_line_1, 51
    assert_valid_length @setting, :office_address_line_1, 50
  end

  test "office_address_line_2" do
    assert_optional @setting, :office_address_line_2
    assert_too_long @setting, :office_address_line_2, 51
    assert_valid_length @setting, :office_address_line_2, 50
  end

  test "office_address_line_3" do
    assert_optional @setting, :office_address_line_3
    assert_too_long @setting, :office_address_line_3, 51
    assert_valid_length @setting, :office_address_line_3, 50
  end

  test "office_address_city" do
    assert_required @setting, :office_address_city
    assert_too_long @setting, :office_address_city, 51
    assert_valid_length @setting, :office_address_city, 50
  end

  test "office_address_postcode" do
    assert_required @setting, :office_address_postcode
    assert_too_long @setting, :office_address_postcode, 51
    assert_valid_length @setting, :office_address_postcode, 50
  end

  test "session_rate is required" do
    assert_required @setting, :session_rate
    assert_too_long @setting, :session_rate, 51
    assert_valid_length @setting, :session_rate, 50
  end

  test "valid record" do
    attrs = {
      telephone: 'a' * 30,
      contact_email: 'a' * 50,
      office_address_line_1: 'a' * 50,
      office_address_line_2: 'a' * 50,
      office_address_line_3: 'a' * 50,
      office_address_city: 'a' * 50,
      office_address_postcode: 'a' * 50,
      session_rate: 'a' * 50
    }

    setting = Setting.create attrs
    assert setting.valid?
  end
end
