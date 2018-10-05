class AboutPage < ApplicationRecord
  has_one_attached :page_photo
  validates :body, presence: true, length: { maximum: 100000 }
end
