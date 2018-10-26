require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest

  test "should get edit" do
    assert_gets edit_settings_path, login_required: true
  end

  test "should update settings" do
    assert_updates settings_url, settings_params, xhr: false, login_required: true, expected_redirect: admin_url, check_active_storage_counts: false
  end

  test "should update settings via xhr" do
    assert_updates settings_url, settings_params, xhr: true, login_required: true, expected_redirect: admin_url, check_active_storage_counts: false
  end

  test "should not update settings if form contains errors" do
    refute_updates settings_url, settings_params(telephone: '', email: ''), xhr: false, login_required: true
  end

  test "should not update settings via xhr if form contains errors" do
    refute_updates settings_url, settings_params(telephone: '', email: ''), xhr: true, login_required: true
  end
end
