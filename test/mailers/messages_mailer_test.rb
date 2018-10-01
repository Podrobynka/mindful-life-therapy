require 'test_helper'

class MessagesMailerTest < ActionMailer::TestCase

  def setup
    @message = Message.new name: 'zoe', email: 'zoe@abc.com', subject: 'hi', body: 'awesome sauce'
  end

  test "send_email" do
    mail = MessagesMailer.send_email(@message, 'info@mindfullifetherapy.co.uk')

    assert_equal ["info@mindfullifetherapy.co.uk"], mail.to
    assert_equal ["zoe@abc.com"], mail.from
    assert_equal "hi", mail.subject
    assert_match "zoe", mail.body.encoded
    assert_match "zoe@abc.com", mail.body.encoded
    assert_match "awesome sauce", mail.body.encoded
  end
end
