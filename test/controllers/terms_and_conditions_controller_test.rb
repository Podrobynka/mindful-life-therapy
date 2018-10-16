require 'test_helper'

class TermsAndConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get terms_and_conditions_url
    assert_response :success
  end

end
