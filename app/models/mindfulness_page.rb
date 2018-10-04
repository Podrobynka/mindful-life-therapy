class MindfulnessPage < ApplicationRecord
  validates :body, presence: true, length: { maximum: 100000 }
end
