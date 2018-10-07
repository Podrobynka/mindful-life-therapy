module HasPagePhoto
  extend ActiveSupport::Concern

  included do
    has_one_attached :page_photo
    validates :page_photo, file_size: allowed_size, content_type: allowed_content_types
  end

  def display_photo
    page_photo.attached? && page_photo.blob.present? ? stored_photo : fallback_photo
  end

  def stored_photo
    page_photo.variant(resize: variant_size)
  end

  def fallback_photo
    translation_for 'fallback'
  end

  def variant_size
    translation_for 'variant'
  end

  def photo_title
    translation_for 'caption'
  end

  def translation_for attr
    I18n.t("page_photo.#{self.class.name.underscore}.#{attr}")
  end

  class_methods do
    def allowed_content_types
      ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
    end

    def allowed_size
      20.megabytes
    end
  end

  # def validate_page_photo
  #   validate_page_photo_size_and_content_type if page_photo.attached?
  # end

  # def validate_page_photo_size_and_content_type
  #   if page_photo.byte_size > 10.megabytes
  #     purge_photo
  #     errors.add :page_photo, 'is too big, the maximum filesize is 10MB.'
  #   elsif !%w(image/png image/gif image/jpeg image/jpg).include?(page_photo.content_type)
  #     purge_photo
  #     errors.add :page_photo, 'is the wrong format, it must be png, gif or jpeg.'
  #   end
  # end
  #
  # def purge_photo
  #   new_record? ? page_photo.purge : reload.page_photo.purge
  # end
end
