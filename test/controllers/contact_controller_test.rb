require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get contact_url
    assert_response :success
  end

  test "should create new message and send email" do
    assert_enqueued_with job: MessageMailerJob, args: ['stephen', 'stephen@example.com', 'hi zoe', 'i would like to sign up for your mindfulness course'], queue: 'default' do
      post create_contact_url, params: { message: { name: 'stephen', email: 'stephen@example.com', subject: 'hi zoe', body: 'i would like to sign up for your mindfulness course' } }
      assert_match /Thankyou/, response.body
    end
  end

  test "should create new message and send email when posted via :xhr" do
    assert_enqueued_with job: MessageMailerJob, args: ['stephen', 'stephen@example.com', 'hi zoe', 'i would like to sign up for your mindfulness course'], queue: 'default' do
      post create_contact_url, xhr: true, params: { message: { name: 'stephen', email: 'stephen@example.com', subject: 'hi zoe', body: 'i would like to sign up for your mindfulness course' } }
      assert_match /Thankyou/, response.body
    end
  end

  test "should show error message when create fails" do
    assert_no_enqueued_jobs do
      post create_contact_url, params: { message: { name: '', email: 'a@b.c', subject: 'hi', body: 'yo' } }
      assert_match /1 error prohibited this record from being saved:/, response.body
    end
  end

  test "should show error message when create fails when posted via :xhr" do
    assert_no_enqueued_jobs do
      post create_contact_url, xhr: true, params: { message: { name: '', email: 'a@b.c', subject: 'hi', body: 'yo' } }
      assert_match /1 error prohibited this record from being saved:/, response.body
    end
  end
end
