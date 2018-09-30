class AboutPage < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :meta_description, presence: true, length: { maximum: 150 }
  validates :body, presence: true, length: { maximum: 100000 }
end
