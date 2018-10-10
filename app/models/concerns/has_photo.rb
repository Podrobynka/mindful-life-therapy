module HasPhoto
  extend ActiveSupport::Concern

  included do
    has_one_attached :photo
    attr_accessor :change_photo
    validates :photo, file_size: allowed_photo_size, content_type: allowed_content_types[:photo]
  end

  def display_photo
    photo.attached? && photo.blob.present? ? stored_photo : fallback_photo
  end

  def stored_photo
    photo.variant(resize: photo_variant_size)
  end

  def fallback_photo
    translation_for 'photo', 'fallback'
  end

  def photo_variant_size
    translation_for 'photo', 'variant'
  end

  def photo_title
    translation_for 'photo', 'caption'
  end

  class_methods do
    def allowed_content_types
      {
        photo: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
      }
    end

    def allowed_photo_size
      20.megabytes
    end
  end
end
