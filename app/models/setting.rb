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

  after_validation :geocode, if: ->(record) { record.address_changed? }

  def address_changed?
    office_address_line_1_changed? ||
    office_address_line_2_changed? ||
    office_address_line_3_changed? ||
    office_address_city_changed? ||
    office_address_postcode_changed?
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
