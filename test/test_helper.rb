ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'

require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'

class ActiveSupport::TestCase
  # allows us to perform enqueued jobs in controller tests
  include ActiveJob::TestHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def photo_fixture
    fixture = Rails.root.join('test', 'fixtures', 'files', 'logo.png')
    fixture_file_upload(fixture, 'image/png')
  end
end
