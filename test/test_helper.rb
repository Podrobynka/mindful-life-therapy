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
    File.join(Rails.root, 'test', 'fixtures', 'files', 'logo.png')
  end

  def pdf_fixture
    File.join(Rails.root, 'test', 'fixtures', 'files', 'dummy.pdf')
  end
end
