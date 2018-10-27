require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    assert_gets login_url
  end

  test "new should redirect to root_url if already logged in" do
    login
    get login_url
    assert_redirected_to root_url
    assert_equal 'You are already logged in', flash[:notice]
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
    assert_equal 'Authentication failed, are you a registered member of the site?', controller.flash[:alert]
  end

  test "update_zoe" do
    GoogleSignIn::Identity.stubs(:new).returns OpenStruct.new(user_id: 'newidforzoe', email_address: 'info@mindfullifetherapy.co.uk')
    LoginsController.any_instance.stubs(:flash).returns({ google_sign_in_token: "some token" })

    # update user to have same google id as zoe
    users(:one).update name: 'Zoe', email: 'info@mindfullifetherapy.co.uk', google_id: Rails.application.credentials.dig(:users, :zoe, :google_id)

    # login
    get create_login_url
    assert_redirected_to admin_url

    # the user should hopefully have been modified so we reload the instance
    users(:one).reload

    assert_equal users(:one), controller.current_user
    assert_equal 'Welcome Zoe', controller.flash[:notice]
    assert_equal 'newidforzoe', users(:one).google_id
  end

  test "destroy should log the user" do
    GoogleSignIn::Identity.stubs(:new).returns OpenStruct.new(user_id: '123456')
    LoginsController.any_instance.stubs(:flash).returns({ google_sign_in_token: "some token" })

    # log the user in
    get create_login_url
    assert_equal users(:one), controller.current_user

    # log the user out
    delete logout_url

    assert_redirected_to root_url
    assert_nil controller.current_user
    assert_equal 'Successfully logged out', controller.flash[:notice]
  end
end
