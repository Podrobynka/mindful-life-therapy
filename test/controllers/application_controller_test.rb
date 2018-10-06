require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test 'renders :not_found upon routing error' do
    get '/home/hello/world'
    assert_response :not_found
    assert_match /Page Not Found/, response.body.to_s
  end
end
