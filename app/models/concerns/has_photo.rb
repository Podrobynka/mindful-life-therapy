module HasPhoto
  extend ActiveSupport::Concern

  included do
    has_one_attached :photo
    validates :photo, file_size: allowed_size, content_type: allowed_content_types
  end

  def display_photo
    photo.attached? && photo.blob.present? ? stored_photo : fallback_photo
  end

  def stored_photo
    photo.variant(resize: variant_size)
  end

  def fallback_photo
    translation_for 'photo', 'fallback'
  end

  def variant_size
    translation_for 'photo', 'variant'
  end

  def photo_title
    translation_for 'photo', 'caption'
  end

  class_methods do
    def allowed_content_types
      ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
    end

    def allowed_size
      20.megabytes
    end
  end
end
