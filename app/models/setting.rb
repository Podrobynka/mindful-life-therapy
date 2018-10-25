class Setting < ApplicationRecord
  geocoded_by :address

  validates :telephone, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 150 }, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'is not a valid email address',
    allow_blank: true
  }
  validates :office_address_line_1, presence: true, length: { maximum: 50 }
  validates :office_address_line_2, length: { maximum: 50 }
  validates :office_address_line_3, length: { maximum: 50 }
  validates :office_address_city, presence: true, length: { maximum: 50 }
  validates :office_address_postcode, presence: true, length: { maximum: 10 }, postcode: true
  validates :session_rate, presence: true, length: { maximum: 50 }

  unless Rails.env.test?
    after_validation :geocode, if: ->(record) { record.address_changed? }
  end

  def address_changed?
    saved_change_to_office_address_line_1 ||
    saved_change_to_office_address_line_2 ||
    saved_change_to_office_address_line_3 ||
    saved_change_to_office_address_city? ||
    saved_change_to_office_address_postcode?
  end

  def address
    [
      office_address_line_1,
      office_address_line_2,
      office_address_line_3,
      office_address_city,
      office_address_postcode
    ].reject(&:blank?).join(', ')
  end
end
