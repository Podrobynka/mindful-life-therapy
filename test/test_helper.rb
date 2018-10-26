ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'

require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'
require 'vcr'
require 'webmock/minitest'

VCR.configure do |config|
  config.cassette_library_dir = 'test/support/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('<KEY>') { Rails.application.credentials.dig(:geocoder, :google_api_key) }
end

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

  def login user: users(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end

  def assert_login_required verb, url, params, xhr: false
    send verb, url, params: params, xhr: xhr
    assert_redirect_or_turbolinks_response login_url, xhr: xhr
    login
  end

  def assert_gets url, params: nil, xhr: false, login_required: false
    assert_login_required(:get, url, params, xhr: xhr) if login_required
    get url, xhr: xhr
    assert_response :success
  end

  def assert_updates url, params, xhr: false, login_required: true, expected_redirect: url, check_active_storage_counts: true
    assert_login_required(:patch, url, params, xhr: xhr) if login_required

    check_active_storage_counts ? perform_update_and_check_active_storage_counts(url, xhr, params, expected_redirect) : perform_update(url, xhr, params, expected_redirect)
  end

  def perform_update url, xhr, params, expected_redirect
    patch url, xhr: xhr, params: params
    assert_redirect_or_turbolinks_response expected_redirect, xhr: xhr
  end

  def perform_update_and_check_active_storage_counts url, xhr, params, expected_redirect
    assert_difference(active_storage_counts) { perform_update url, xhr, params, expected_redirect }
  end

  def refute_updates url, params, xhr: false, login_required: true
    assert_login_required(:patch, url, params, xhr: xhr) if login_required

    assert_no_difference active_storage_counts do
      patch url, xhr: xhr, params: params
      assert_match /The form contains 2 errors:/, response.body.to_s
    end
  end

  def assert_redirect_or_turbolinks_response url, xhr: false
    xhr ? assert_turbolinks_response_for(url) : assert_redirected_to(url)
  end

  def assert_turbolinks_response_for url
    assert_match %Q{Turbolinks.visit("#{url}", {"action":"replace"})}, response.body
  end

  def page_params controller_name, body: 'hi', size: 1.byte
    { controller_name => { body: body, photo: stubbed_photo_fixture(size) } }
  end

  def settings_params setting: settings(:one), telephone: setting.telephone, email: setting.email
    { setting: { telephone: telephone, email: email, office_address_line_1: setting.office_address_line_1, office_address_line_2: setting.office_address_line_2, office_address_line_3: setting.office_address_line_3, office_address_city: setting.office_address_city, office_address_postcode: setting.office_address_postcode, session_rate: setting.session_rate } }
  end

  def active_storage_counts
    ['ActiveStorage::Blob.count', 'ActiveStorage::Attachment.count']
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
