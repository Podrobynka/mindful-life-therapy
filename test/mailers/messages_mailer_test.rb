require 'test_helper'

class MessagesMailerTest < ActionMailer::TestCase
  def setup
    @message = Message.new name: 'awesome', email: 'awe@some.com', subject: 'awesome', body: 'awesome'
  end

  test "send_email" do
    mail = MessagesMailer.send_email(@message, 'info@mindfullifetherapy.co.uk')

    assert_equal "awesome", mail.subject
    assert_equal ["info@mindfullifetherapy.co.uk"], mail.to
    assert_equal ["awe@some.com"], mail.from
    assert_match "awesome", mail.body.encoded
  end
end
