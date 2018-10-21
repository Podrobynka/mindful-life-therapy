class Setting < ApplicationRecord
  validates :telephone, presence: true, length: { maximum: 30 }
  validates :contact_email, presence: true, length: { maximum: 150 }, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'is not a valid email address',
    allow_blank: true
  }
  validates :office_address_line_1, presence: true, length: { maximum: 50 }
  validates :office_address_line_2, length: { maximum: 50 }
  validates :office_address_line_3, length: { maximum: 50 }
  validates :office_address_city, presence: true, length: { maximum: 50 }
  validates :office_address_postcode, presence: true, length: { maximum: 50 }
  validates :session_rate, presence: true, length: { maximum: 50 }
end
