require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  setup do
    @setting = Setting.create
  end

  test "telephone is required" do
    assert_match /blank/, @setting.errors[:telephone].to_s
  end

  test "office_address is required" do
    assert_match /blank/, @setting.errors[:office_address].to_s
  end

  test "hourly_rate is required" do 
    assert_match /blank/, @setting.errors[:hourly_rate].to_s
  end

  test "contact_email is required" do
    assert_match /blank/, @setting.errors[:contact_email].to_s
  end
end
