require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  test 'name' do
    assert_required @user, :name
    assert_too_long @user, :name, 101
    assert_valid_length @user, :name, 100
  end

  test "contact_email" do
    assert_required @user, :email
    assert_email_too_long @user, 151
    assert_email_valid_length @user, 150
    assert_invalid_emails_are_rejected @user
    assert_valid_emails_are_accepted @user
    assert_blank_email_only_fails_presence_validation @user
  end

  test 'google_id' do
    assert_required @user, :google_id
    assert_too_long @user, :google_id, 201
    assert_valid_length @user, :google_id, 200
  end
end
