require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest

  test "should show setting" do
    get settings_url
    assert_response :success
  end

  test "should get edit" do
    get edit_settings_url
    assert_response :success
  end

  test "should update setting" do
    @setting = settings(:one)
    patch settings_url, params: { setting: { telephone: @setting.telephone, contact_email: @setting.contact_email, office_address_line_1: @setting.office_address_line_1, office_address_line_2: @setting.office_address_line_2, office_address_line_3: @setting.office_address_line_3, office_address_city: @setting.office_address_city, office_address_postcode: @setting.office_address_postcode, session_rate: @setting.session_rate } }
    assert_redirected_to settings_url
  end

  test "should update setting via :xhr" do
    @setting = settings(:one)
    patch settings_url, xhr: true, params: { setting: { telephone: @setting.telephone, contact_email: @setting.contact_email, office_address_line_1: @setting.office_address_line_1, office_address_line_2: @setting.office_address_line_2, office_address_line_3: @setting.office_address_line_3, office_address_city: @setting.office_address_city, office_address_postcode: @setting.office_address_postcode, session_rate: @setting.session_rate } }
    assert_match 'Turbolinks.visit("http://www.example.com/settings", {"action":"replace"})', response.body
  end

  test "should show error message when update fails" do
    @setting = settings(:one)
    patch settings_url, params: { setting: { telephone: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end

  test "should show error message when update via :xhr fails" do
    @setting = settings(:one)
    patch settings_url, xhr: true, params: { setting: { telephone: '' } }
    assert_match /1 error prohibited this record from being saved/, response.body
  end
end
