require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    assert_gets login_url
  end

  test "create should log user in and redirect to admin page" do
    GoogleSignIn::Identity.stubs(:new).returns OpenStruct.new(user_id: '123456')
    LoginsController.any_instance.stubs(:flash).returns({ google_sign_in_token: "some token" })

    get create_login_url
    assert_redirected_to admin_url
    assert_equal users(:one), controller.current_user
    assert_equal 'Welcome stephen', controller.flash[:notice]
  end

  test "create should fail when user is not a member" do
    GoogleSignIn::Identity.stubs(:new).returns OpenStruct.new(user_id: 'wrong')
    LoginsController.any_instance.stubs(:flash).returns({ google_sign_in_token: "some token" })

    get create_login_url
    assert_redirected_to login_url
    assert_nil controller.current_user
    assert_equal 'Authentication failed, please try again', controller.flash[:alert]
  end

  # test "should get create" do
  #   FakeResponse = Struct.new(:user_id)
  #   GoogleSignIn::Identity.stubs(:new).returns FakeResponse.new('123456')
  #   LoginsController.any_instance.stubs(:flash).returns({ google_sign_in_token: "abc123" })
  #
  #   VCR.use_cassette("login_with_gmail") do
  #     assert_gets create_login_url
  #   end
  # end

  # test "should logout" do
  #   assert_gets create_login_url, google_login_params
  # end

end
