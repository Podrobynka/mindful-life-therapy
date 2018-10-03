require 'test_helper'

class MessagesMailerTest < ActionMailer::TestCase

  test "send_email" do
    mail = MessagesMailer.send_email('stephen murdoch', 'stephen@example.com', 'hi zoe', 'i would like to sign up for your mindfulness course')

    assert_emails 1 do
      mail.deliver_now
    end

    assert_equal ["info@mindfullifetherapy.co.uk"], mail.to
    assert_equal ["stephen@example.com"], mail.from
    assert_equal "hi zoe", mail.subject
    assert_match "stephen murdoch", mail.body.encoded
    assert_match "stephen@example.com", mail.body.encoded
    assert_match "hi zoe", mail.body.encoded
    assert_match "i would like to sign up for your mindfulness course", mail.body.encoded
  end
end
