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
    assert_required @setting, :email
    assert_email_too_long @setting, 151
    assert_email_valid_length @setting, 150
    assert_invalid_emails_are_rejected @setting
    assert_valid_emails_are_accepted @setting
    assert_blank_email_only_fails_presence_validation @setting
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
    assert_too_long @setting, :office_address_postcode, 11
    assert_invalid_postcodes_are_rejected @setting
    assert_valid_postcodes_are_accepted @setting
  end

  test "session_rate is required" do
    assert_required @setting, :session_rate
    assert_too_long @setting, :session_rate, 51
    assert_valid_length @setting, :session_rate, 50
  end

  test "address rejects blanks" do
    assert_equal '10 Newton Place, Glasgow, G3 7PR', @setting.address
  end

  test "address returns all address fields if present" do
    @setting.update(office_address_line_2: 'Top Floor', office_address_line_3: 'Back Office')
    assert_equal '10 Newton Place, Top Floor, Back Office, Glasgow, G3 7PR', @setting.address
  end

  test "address_changed? is true if any address related attribute changes" do
    @setting.update(office_address_line_2: 'Top Floor')
    assert @setting.address_changed?
  end

  test "address_changed? is false if no address related attribute changed" do
    @setting.update(session_rate: '£5000 per 50 minute session')
    refute @setting.address_changed?
  end

  test "create valid record" do
    attrs = {
      telephone: 'a' * 30,
      email: 'a' * 145 + '@b.co',
      office_address_line_1: 'a' * 50,
      office_address_line_2: 'a' * 50,
      office_address_line_3: 'a' * 50,
      office_address_city: 'a' * 50,
      office_address_postcode: 'g1 1aa',
      session_rate: 'a' * 50
    }

    setting = Setting.create attrs
    assert setting.valid?
  end

  test "update valid record" do
    attrs = {
      telephone: 'a' * 30,
      email: 'a' * 145 + '@b.co',
      office_address_line_1: 'a' * 50,
      office_address_line_2: 'a' * 50,
      office_address_line_3: 'a' * 50,
      office_address_city: 'a' * 50,
      office_address_postcode: 'g1 1aa',
      session_rate: 'a' * 50
    }

    @setting.update attrs
    assert @setting.valid?
  end
end
