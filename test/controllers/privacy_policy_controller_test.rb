require 'test_helper'

class PrivacyPolicyControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    assert_gets privacy_policy_path
  end

end
