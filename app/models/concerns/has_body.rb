module HasBody
  extend ActiveSupport::Concern

  included do
    validates :body, presence: true, length: { maximum: 100000 }
  end

  def trix_input
    translation_for 'forms', 'trix_input'
  end

  def body_placeholder
    translation_for 'forms', 'body_placeholder'
  end
end
