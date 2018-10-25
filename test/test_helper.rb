ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'

require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'
# require 'vcr'
#
# VCR.config do |c|
#   c.cassette_library_dir = 'test/vcr_cassettes'
#   c.stub_with :fakeweb
#   c.default_cassette_options = { :record => :once }
# end

class ActiveSupport::TestCase
  # allows us to perform enqueued jobs in controller tests
  include ActiveJob::TestHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # fixture helper methods

  def photo_fixture
    File.join(Rails.root, 'test', 'fixtures', 'files', 'logo.png')
  end

  def pdf_fixture
    File.join(Rails.root, 'test', 'fixtures', 'files', 'dummy.pdf')
  end

  def stubbed_photo_fixture size
    ActiveStorage::Blob.any_instance.stubs(:byte_size).returns(size)
    fixture_file_upload('files/logo.png', 'image/png')
  end

  def content_types_fixture
    %w(image/png image/jpg image/jpeg image/gif)
  end

  def fallback_photos
    {
      about_page: 'about/zoe-zalavary-glasgow-counsellor-psychotherapist-mindful-life-therapy.jpg',
      counselling_page: 'counselling-and-psychotherapy/flowers.png',
      mindfulness_page: 'mindfulness/mindfulness-meditation.jpg'
    }
  end

  def address_fixture
    {
      office_address_line_1: 'Awesome House',
      office_address_line_2: 'Apartment 95',
      office_address_line_3: 'Cool Street',
      office_address_city: 'Amazing City',
      office_address_postcode: 'G1 1AA'
    }
  end

  def address_fixture_with_blanks
    {
      office_address_line_1: 'Awesome House',
      office_address_line_2: '',
      office_address_line_3: nil,
      office_address_city: 'Amazing City',
      office_address_postcode: 'G1 1AA'
    }
  end

  # controller test helper methods

  def assert_gets url
    get url
    assert_response :success
  end

  def assert_updates_page controller_name
    assert_difference active_storage_counts do
      path = url_for(controller_name)
      patch path, params: params_for(controller_name, 'hello', 20.megabytes)
      assert_redirected_to path
    end
  end

  def assert_updates_page_via_xhr controller_name
    assert_difference active_storage_counts do
      path = url_for(controller_name)
      patch path, xhr: true, params: params_for(controller_name, 'hello', 20.megabytes)
      assert_match turbolinks_response_for(path), response.body
    end
  end

  def assert_update_fails controller_name
    assert_no_difference active_storage_counts do
      path = url_for(controller_name)
      patch path, params: params_for(controller_name, '', 21.megabytes)
      assert_match /The form contains 2 errors:/, response.body.to_s
    end
  end

  def assert_update_fails_via_xhr controller_name
    assert_no_difference active_storage_counts do
      path = url_for(controller_name)
      patch path, xhr: true, params: params_for(controller_name, '', 21.megabytes)
      assert_match /The form contains 2 errors:/, response.body.to_s
    end
  end

  def turbolinks_response_for path
    %Q{Turbolinks.visit("#{path}", {"action":"replace"})}
  end

  def active_storage_counts
    ['ActiveStorage::Blob.count', 'ActiveStorage::Attachment.count']
  end

  def params_for controller_name, body, size
    { controller_name => { body: body, photo: stubbed_photo_fixture(size) } }
  end

  # model test helper methods

  def assert_required record, attribute
    record.update attribute => ''
    assert_match /blank/, record.errors[attribute].to_s
  end

  def assert_optional record, attribute
    record.update attribute => ''
    assert_empty record.errors[attribute]
  end

  def assert_too_long record, attribute, length
    long = 'a' * length
    record.update attribute => long
    assert_match /too long/, record.errors[attribute].to_s
  end

  def assert_valid_length record, attribute, length
    valid = 'a' * length
    record.update attribute => valid
    assert record.valid?
  end

  def assert_email_too_long record, length
    tail = '@b.co'
    head = 'a' * (length - tail.length)
    record.update email: head + tail
    refute record.valid?
    assert_match /too long/, record.errors[:email].to_s
  end

  def assert_email_valid_length record, length
    tail = '@b.co'
    head = 'a' * (length - tail.length)
    record.update email: head + tail
    assert record.valid?
    assert_empty record.errors[:email]
  end

  def assert_invalid_emails_are_rejected record
    invalid_emails = ['a', 'a@', '@com', '@', '.com', 'a@.com', 'a@.', '.', 'a @b.com', 'a@b .com', 'a@b.co m']

    invalid_emails.each do |email|
      record.update email: email
      refute record.valid?
      assert_match /is not a valid email address/, record.errors[:email].to_s
    end
  end

  def assert_valid_emails_are_accepted record
    valid_emails = ['a@b', 'a@b.com', '$@com', 'test+1@b.com']

    valid_emails.each do |email|
      record.update email: email
      assert record.valid?
      assert_empty record.errors[:email]
    end
  end

  def assert_blank_email_only_fails_presence_validation record
    blank_emails = ['', ' ', nil]

    blank_emails.each do |email|
      record.update email: email
      refute record.valid?
      assert_equal ["can't be blank"], record.errors[:email]
    end
  end

  def assert_postcode_too_long record
    record.update office_address_postcode: 'ab123 123qw'
    refute record.valid?
    assert_match /too long/, record.errors[:office_address_postcode].to_s
  end

  def assert_invalid_postcodes_are_rejected record
    ['1', 'a', 'abc', 'ab123', 'ab123 1aa'].each do |invalid_postcode|
      record.update office_address_postcode: invalid_postcode
      refute record.valid?
      assert_match /is not a recognised UK postcode/, record.errors[:office_address_postcode].to_s
    end
  end

  def assert_valid_postcodes_are_accepted record
    ['g1 1aa', 'g11aa', 'g3 7pr', 'g37pr', 'g52 2qw', 'g522qw'].each do |valid_postcode|
      record.update office_address_postcode: valid_postcode
      assert record.valid?
      assert_empty record.errors[:office_address_postcode]
    end
  end

  def assert_has_one_attached_photo record
    attach_file_to record, photo_fixture
    assert record.valid?
    assert record.photo.attached?
    assert_equal 'logo.png', record.photo.filename.to_s
  end

  def assert_too_big record, fixture, size
    stub_size_and_attach_file_to record, fixture, size
    refute record.valid?
    refute record.photo.attached?
    assert_match /is too big/, record.errors[:photo].to_s
  end

  def assert_valid_size record, fixture, size
    stub_size_and_attach_file_to record, fixture, size
    assert record.valid?
    assert record.photo.attached?
    assert_empty record.errors[:photo]
  end

  def assert_allowed_size record, fixture, size
    assert_equal size, record.class.allowed_photo_size
  end

  def assert_wrong_format record, attribute, fixture
    attach_file_to record, fixture
    refute record.valid?
    refute record.send(attribute).attached?
    assert_match /is the wrong format/, record.errors[attribute].to_s
  end

  def assert_valid_format record, attribute, fixture
    attach_file_to record, fixture
    assert record.valid?
    assert record.send(attribute).attached?
    assert_empty record.errors[attribute]
  end

  def assert_allowed_content_types record, attribute, content_types
    actual = record.class.allowed_content_types[attribute]
    assert_equal content_types.sort, actual.sort
  end

  def assert_display_photo_defaults_to_fallback_photo record, fallback
    assert_equal fallback, record.display_photo
    assert_equal fallback, record.fallback_photo
    assert_equal record.display_photo, record.fallback_photo
  end

  def assert_display_photo_returns_stored_photo_if_it_exists record, fixture
    attach_file_to record, fixture
    assert_instance_of ActiveStorage::Variant, record.display_photo
    assert_instance_of ActiveStorage::Variant, record.stored_photo
    assert_equal 'logo.png', record.display_photo.image.send(:filename).to_s
    assert_equal 'logo.png', record.stored_photo.image.send(:filename).to_s
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

  # message model test helpers
  #
  # message model does not inherit from activerecord
  # and it's instances are not persisted

  def assert_message_attribute_required record, attribute
    assert_match /blank/, record.errors[attribute].to_s
  end

  def assert_message_attribute_too_long record, attribute, length
    record.send("#{attribute}=", 'a' * length)
    record.valid?
    assert_match /too long/, record.errors[attribute].to_s
  end

  def assert_message_attribute_valid_length record, attribute, length
    record.send("#{attribute}=", 'a' * length)
    record.valid?
    assert_empty record.errors[attribute]
  end

  def assert_message_email_too_long record, length
    tail = '@b.co'
    head = 'a' * (length - tail.length)
    record.email = head + tail
    record.valid?
    assert_match /too long/, record.errors[:email].to_s
  end

  def assert_message_email_valid_length record, length
    tail = '@b.co'
    head = 'a' * (length - tail.length)
    record.email = head + tail
    record.valid?
    assert_empty record.errors[:email]
  end

  def assert_invalid_message_emails_are_rejected record
    invalid_emails = ['a', 'a@', '@com', '@', '.com', 'a@.com', 'a@.', '.', 'a @b.com', 'a@b .com', 'a@b.co m']

    invalid_emails.each do |email|
      record.email = email
      record.valid?
      assert_match /is not a valid email address/, record.errors[:email].to_s
    end
  end

  def assert_valid_message_emails_are_accepted record
    valid_emails = ['a@b', 'a@b.com', '$@com', 'test+1@b.com']

    valid_emails.each do |email|
      record.email = email
      record.valid?
      assert_empty record.errors[:email]
    end
  end

  def assert_blank_message_email_only_fails_presence_validation record
    blank_emails = ['', ' ', nil]

    blank_emails.each do |email|
      record.email = email
      record.valid?
      assert_equal ["can't be blank"], record.errors[:email]
    end
  end
end
