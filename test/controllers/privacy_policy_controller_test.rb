require 'test_helper'

class PrivacyPolicyControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get privacy_policy_url
    assert_response :success
  end

end
