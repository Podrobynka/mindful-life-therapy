require 'test_helper'

class TermsAndConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    assert_gets terms_and_conditions_path
  end

end
