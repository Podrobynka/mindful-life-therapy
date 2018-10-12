class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :body

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :subject, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 10000 }
end
