require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get contact_url
    assert_response :success
  end

  test "should create new message and send email" do
    perform_enqueued_jobs do
      assert_difference 'ActionMailer::Base.deliveries.count' do
        post create_contact_url, params: { message: { name: 'a', email: 'a@b.c', subject: 'hi', body: 'yo' } }
        assert_match /Thankyou/, response.body
      end
    end
  end

  test "should create new message and send email when posted via :xhr" do
    perform_enqueued_jobs do
      assert_difference 'ActionMailer::Base.deliveries.count' do
        post create_contact_url, xhr: true, params: { message: { name: 'a', email: 'a@b.c', subject: 'hi', body: 'yo' } }
        assert_match /Thankyou/, response.body
      end
    end
  end

  test "should show error message when create fails" do
    perform_enqueued_jobs do
      assert_no_difference 'ActionMailer::Base.deliveries.count' do
        post create_contact_url, params: { message: { name: '', email: 'a@b.c', subject: 'hi', body: 'yo' } }
        assert_match /1 error prohibited this record from being saved:/, response.body
      end
    end
  end

  test "should show error message when create fails when posted via :xhr" do
    perform_enqueued_jobs do
      assert_no_difference 'ActionMailer::Base.deliveries.count' do
        post create_contact_url, xhr: true, params: { message: { name: '', email: 'a@b.c', subject: 'hi', body: 'yo' } }
        assert_match /1 error prohibited this record from being saved:/, response.body
      end
    end
  end
end
