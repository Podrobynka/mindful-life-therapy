class Setting < ApplicationRecord
  validates_presence_of :telephone, :contact_email, :office_address, :hourly_rate

  validates :telephone, presence: true, length: { maximum: 20 }
  validates :contact_email, presence: true, length: { maximum: 50 }
  validates :office_address, presence: true, length: { maximum: 50 }
  validates :hourly_rate, presence: true, length: { maximum: 5 }
end
