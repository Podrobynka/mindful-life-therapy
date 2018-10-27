class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :google_id, presence: true, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 150 }, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'is not a valid email address',
    allow_blank: true
  }
end
