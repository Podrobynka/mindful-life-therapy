require 'test_helper'

class MessageMailerJobTest < ActiveJob::TestCase
  setup do
    @message = Message.new name: 'hi', email: 'hello@world.com', subject: 'hi', body: 'hello world'
    @recipient = 'zoe@example.com'
  end

  test 'queues work as expected' do
    assert_enqueued_jobs 0
    MessageMailerJob.perform_later(@message.to_json, @recipient)
    assert_enqueued_jobs 1
  end
end
