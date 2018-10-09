require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  setup do
    @message = Message.new
    @message.valid?
  end

  test 'name' do
    assert_message_attribute_required @message, :name
    assert_message_attribute_too_long @message, :name, 101
    assert_message_attribute_valid_length @message, :name, 100
  end

  test 'email' do
    assert_message_attribute_required @message, :email
    assert_message_attribute_too_long @message, :email, 101
    assert_message_attribute_valid_length @message, :email, 100
  end

  test 'subject' do
    assert_message_attribute_required @message, :subject
    assert_message_attribute_too_long @message, :subject, 51
    assert_message_attribute_valid_length @message, :subject, 50
  end

  test 'body' do
    assert_message_attribute_required @message, :body
    assert_message_attribute_too_long @message, :body, 1001
    assert_message_attribute_valid_length @message, :body, 1000
  end

  test 'valid message' do
    @message.name = 'a' * 100
    @message.email = 'a' * 100
    @message.subject = 'a' * 50
    @message.body = 'a' * 1000

    assert @message.valid?
  end
end
