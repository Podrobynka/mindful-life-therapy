module HasPagePhoto
  extend ActiveSupport::Concern

  included do
    has_one_attached :page_photo
  end

  def display_photo
    page_photo.attached? ? stored_photo : fallback_photo
  end

  def stored_photo
    page_photo.variant(resize: photo_variant)
  end

  def photo_title
    translation_for 'caption'
  end

  def fallback_photo
    translation_for 'fallback'
  end

  def photo_variant
    translation_for 'variant'
  end

  def translation_for attr
    I18n.t("page_photo.#{self.class.name.underscore}.#{attr}")
  end
end
