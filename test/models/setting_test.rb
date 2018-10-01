require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  test "creates a valid settings record" do
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

  test "telephone is required" do
    setting = Setting.create
    assert_match /blank/, setting.errors[:telephone].to_s
  end

  test "telephone has max length" do
    setting = Setting.create telephone: '0' * 31
    assert_match /too long/, setting.errors[:telephone].to_s
  end

  test "contact_email is required" do
    setting = Setting.create
    assert_match /blank/, setting.errors[:contact_email].to_s
  end

  test "contact_email has max length" do
    setting = Setting.create contact_email: 'a' * 51
    assert_match /too long/, setting.errors[:contact_email].to_s
  end

  test "office_address_line_1 is required" do
    setting = Setting.create
    assert_match /blank/, setting.errors[:office_address_line_1].to_s
  end

  test "office_address_line_1 has max length" do
    setting = Setting.create office_address_line_1: 'a' * 51
    assert_match /too long/, setting.errors[:office_address_line_1].to_s
  end

  test "office_address_line_2 is not required" do
    setting = Setting.create
    assert_empty setting.errors[:office_address_line_2]
  end

  test "office_address_line_2 has max length" do
    setting = Setting.create office_address_line_2: 'a' * 51
    assert_match /too long/, setting.errors[:office_address_line_2].to_s
  end

  test "office_address_line_3 is not required" do
    setting = Setting.create
    assert_empty setting.errors[:office_address_line_3]
  end

  test "office_address_line_3 has max length" do
    setting = Setting.create office_address_line_3: 'a' * 51
    assert_match /too long/, setting.errors[:office_address_line_3].to_s
  end

  test "office_address_city is required" do
    setting = Setting.create
    assert_match /blank/, setting.errors[:office_address_city].to_s
  end

  test "office_address_city has max length" do
    setting = Setting.create office_address_city: 'a' * 51
    assert_match /too long/, setting.errors[:office_address_city].to_s
  end

  test "office_address_postcode is required" do
    setting = Setting.create
    assert_match /blank/, setting.errors[:office_address_postcode].to_s
  end

  test "office_address_postcode has max length" do
    setting = Setting.create office_address_postcode: 'a' * 51
    assert_match /too long/, setting.errors[:office_address_postcode].to_s
  end

  test "session_rate is required" do
    setting = Setting.create
    assert_match /blank/, setting.errors[:session_rate].to_s
  end

  test "session_rate has max length" do
    setting = Setting.create session_rate: 'a' * 51
    assert_match /too long/, setting.errors[:session_rate].to_s
  end
end
