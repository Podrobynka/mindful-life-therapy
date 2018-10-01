require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test 'valid message' do
    attrs = {
      name: 'a' * 100,
      email: 'a' * 100,
      subject: 'a' * 50,
      body: 'a' * 100
    }

    message = Message.new attrs
    assert message.valid?
  end

  test 'name is required' do
    message = Message.new
    refute message.valid?
    assert_match /blank/, message.errors[:name].to_s
  end

  test 'name has max length' do
    message = Message.new name: 'a' * 101
    refute message.valid?
    assert_match /too long/, message.errors[:name].to_s
  end

  test 'email is required' do
    message = Message.new
    refute message.valid?
    assert_match /blank/, message.errors[:email].to_s
  end

  test 'email has max length' do
    message = Message.new email: 'a' * 101
    refute message.valid?
    assert_match /too long/, message.errors[:email].to_s
  end

  test 'subject is required' do
    message = Message.new
    refute message.valid?
    assert_match /blank/, message.errors[:subject].to_s
  end

  test 'subject has max length' do
    message = Message.new subject: 'a' * 51
    refute message.valid?
    assert_match /too long/, message.errors[:subject].to_s
  end

  test 'body is required' do
    message = Message.new
    refute message.valid?
    assert_match /blank/, message.errors[:body].to_s
  end

  test 'body has max length' do
    message = Message.new body: 'a' * 1001
    refute message.valid?
    assert_match /too long/, message.errors[:body].to_s
  end
end
