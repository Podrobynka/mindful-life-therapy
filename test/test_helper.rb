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

  def photo_fixture
    File.join(Rails.root, 'test', 'fixtures', 'files', 'logo.png')
  end

  def pdf_fixture
    File.join(Rails.root, 'test', 'fixtures', 'files', 'dummy.pdf')
  end

  # Add more helper methods to be used by all tests here...

  def assert_body_is_required record
    record.update body: ''
    assert_match /blank/, record.errors[:body].to_s
  end

  def assert_body_has_max_length record, length
    invalid_body = 'a' * length
    record.update body: invalid_body
    assert_match /too long/, record.errors[:body].to_s
  end

  def assert_body_with_valid_length record, length
    valid_body = 'a' * length
    record.update body: valid_body
    assert record.valid?
  end

  def assert_has_one_attached_photo record
    attach_file_to record, photo_fixture
    assert record.valid?
    assert record.photo.attached?
    assert_equal 'logo.png', record.photo.filename.to_s
  end

  def assert_photo_has_restricted_content_type record
    attach_file_to record, pdf_fixture
    refute record.valid?
    refute record.photo.attached?
    assert_match /is the wrong format/, record.errors[:photo].to_s
  end

  def assert_allowed_photo_content_types record, expected
    assert_equal expected.sort, record.class.allowed_photo_content_types.sort
  end

  def assert_photo_has_max_size record, size
    stub_size_and_attach_file_to record, photo_fixture, size
    refute record.valid?
    refute record.photo.attached?
    assert_match /is too big/, record.errors[:photo].to_s
  end

  def assert_photo_with_valid_size record, size
    stub_size_and_attach_file_to record, photo_fixture, size
    assert record.valid?
    assert record.photo.attached?
    assert_empty record.errors[:photo]
  end

  def assert_allowed_photo_size record, size
    assert_equal size, record.class.allowed_photo_size
  end

  def assert_display_photo_defaults_to_fallback_photo record, fallback
    assert_equal fallback, record.display_photo
    assert_equal fallback, record.fallback_photo
    assert_equal record.display_photo, record.fallback_photo
  end

  def assert_display_photo_returns_stored_photo_if_it_exists record
    attach_file_to record, photo_fixture
    assert_instance_of ActiveStorage::Variant, record.display_photo
    assert_instance_of ActiveStorage::Variant, record.stored_photo
  end

  def assert_photo_title record, title
    assert_equal title, record.photo_title
  end

  def assert_photo_variant_size record, size
    assert_equal size, record.photo_variant_size
  end

  def attach_file_to record, fixture
    File.open(fixture) do |file|
      record.photo.attach io: file, filename: File.basename(fixture)
    end
  end

  def stub_size_and_attach_file_to record, fixture, size
    File.open(fixture) do |file|
      file.stubs(:size).returns(size)
      record.photo.attach io: file, filename: File.basename(file)
    end
  end
end
