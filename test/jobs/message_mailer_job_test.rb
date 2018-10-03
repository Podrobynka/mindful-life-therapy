require 'test_helper'

class MessageMailerJobTest < ActiveJob::TestCase
  test 'queues work as expected' do
    assert_no_enqueued_jobs
    MessageMailerJob.perform_later 'stephen', 'stephen@example.com', 'hi zoe', 'i would like to sign up for your mindfulness course'
    assert_enqueued_jobs 1
  end

  test 'email is sent' do
    perform_enqueued_jobs do
      assert_difference 'ActionMailer::Base.deliveries.count' do
        MessageMailerJob.perform_later 'stephen', 'stephen@example.com', 'hi zoe', 'i would like to sign up for your mindfulness course'
      end
    end
  end
end
