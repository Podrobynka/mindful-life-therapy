module HasBody
  extend ActiveSupport::Concern

  included do
    validates :body, presence: true, length: { maximum: 100000 }
  end
end
