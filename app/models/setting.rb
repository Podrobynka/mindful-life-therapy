class Setting < ApplicationRecord
  validates_presence_of :telephone, :contact_email, :office_address, :hourly_rate
end
