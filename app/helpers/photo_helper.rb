module PhotoHelper
  def photo_for record
    image_tag record.display_photo,
      title: record.photo_title,
      alt: record.photo_title,
      class: 'border-radius'
  end

  def file_upload_preview_photo_for record: nil, data_target: nil
    image_tag record.display_photo,
      title: record.photo_title,
      alt: record.photo_title,
      class: 'border-radius',
      data: { target: data_target, original_photo: original_photo_for(record) }
  end

  def original_photo_for record
    if record.photo.attached? && record.photo.blob.present?
      polymorphic_url(record.stored_photo)
    else
      image_path(record.fallback_photo)
    end
  end
end
