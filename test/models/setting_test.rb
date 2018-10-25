require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  setup do
    @setting = settings(:one)
  end

  test "session_rate is required" do
    assert_required @setting, :session_rate
    assert_too_long @setting, :session_rate, 51
    assert_valid_length @setting, :session_rate, 50
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
    VCR.use_cassette("update_office_address_line_1") do
      assert_required @setting, :office_address_line_1
      assert_too_long @setting, :office_address_line_1, 51
      assert_valid_length @setting, :office_address_line_1, 50
    end
  end

  test "office_address_line_2" do
    VCR.use_cassette("update_office_address_line_2") do
      assert_optional @setting, :office_address_line_2
      assert_too_long @setting, :office_address_line_2, 51
      assert_valid_length @setting, :office_address_line_2, 50
    end
  end

  test "office_address_line_3" do
    VCR.use_cassette("update_office_address_line_3") do
      assert_optional @setting, :office_address_line_3
      assert_too_long @setting, :office_address_line_3, 51
      assert_valid_length @setting, :office_address_line_3, 50
    end
  end

  test "office_address_city" do
    VCR.use_cassette("update_office_address_city") do
      assert_required @setting, :office_address_city
      assert_too_long @setting, :office_address_city, 51
      assert_valid_length @setting, :office_address_city, 50
    end
  end

  test "office_address_postcode" do
    VCR.use_cassette("update_office_address_postcode") do
      assert_required @setting, :office_address_postcode
      assert_too_long @setting, :office_address_postcode, 11
      assert_invalid_postcodes_are_rejected @setting
      assert_valid_postcodes_are_accepted @setting
    end
  end

  test "address rejects blanks" do
    assert_equal '10 Newton Place, Glasgow, G3 7PR', @setting.address
  end

  test "address returns all address fields if present" do
    VCR.use_cassette("update_office_address_line_2_and_office_address_line_3") do
      @setting.update(office_address_line_2: 'Top Floor', office_address_line_3: 'Back Office')
      assert_equal '10 Newton Place, Top Floor, Back Office, Glasgow, G3 7PR', @setting.address
    end
  end

  test "address_changed? is true if changed address attribute are staged prior to save" do
    @setting.office_address_line_2 = 'Top Floor'
    assert @setting.address_changed?
  end

  test "address_changed? is false AFTER save, even if address attributes changed during the save" do
    VCR.use_cassette("update_office_address_line_2_to_top_floor") do
      @setting.update office_address_line_2: 'Top Floor'
      refute @setting.address_changed?
    end
  end

  test "address_changed? is false if no address related attribute change" do
    @setting.session_rate = '£5000 per 50 minute session'
    refute @setting.address_changed?
  end

  test "create valid record sets lat and lon" do
    attrs = {
      telephone: '07933446549',
      email: 'info@mindfullifetherapy.co.uk',
      office_address_line_1: '10 Newton Place',
      office_address_line_2: 'Top Floor',
      office_address_line_3: 'Red Door',
      office_address_city: 'Glasgow',
      office_address_postcode: 'G3 7PR',
      session_rate: '£55 per 50 minute session'
    }

    VCR.use_cassette('create_valid_settings_record') do
      setting = Setting.create attrs
      assert setting.valid?
      assert_equal 55.8664365, setting.latitude
      assert_equal -4.2748123, setting.longitude
    end
  end

  test "update record with new address attrs changes lat and long" do
    attrs = {
      telephone: '07933446549',
      email: 'info@mindfullifetherapy.co.uk',
      office_address_line_1: '3 Lynedoch Place',
      office_address_line_2: 'Top Floor',
      office_address_line_3: 'Red Door',
      office_address_city: 'Glasgow',
      office_address_postcode: 'G3 6AB',
      session_rate: '£55 per 50 minute session'
    }

    VCR.use_cassette("update_valid_settings_record") do
      @setting.update attrs
      assert @setting.valid?
      assert_equal 55.8687866, @setting.latitude
      assert_equal -4.276115799999999, @setting.longitude
    end
  end

  test "update record without changing address attrs does not change lat and long" do
    attrs = {
      telephone: '07933446549',
      email: 'info@mindfullifetherapy.co.uk',
      session_rate: '£55 per 50 minute session'
    }

    @setting.update attrs
    assert @setting.valid?
    assert_equal 12345.67890, @setting.latitude
    assert_equal 12345.67890, @setting.longitude
  end
end
