require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:one)
  end

  test "should show setting" do
    get settings_url
    assert_response :success
  end

  test "should get edit" do
    get edit_settings_url
    assert_response :success
  end

  test "should update setting" do
    patch settings_url, params: { setting: { contact_email: @setting.contact_email, hourly_rate: @setting.hourly_rate, office_address: @setting.office_address, telephone: @setting.telephone } }
    assert_redirected_to settings_url
  end
end
