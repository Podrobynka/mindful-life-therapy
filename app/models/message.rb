class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :body

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 150 }, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'is not a valid email address',
    allow_blank: true
  }
  validates :subject, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 10000 }
end
