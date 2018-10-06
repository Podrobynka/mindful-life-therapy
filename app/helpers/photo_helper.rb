module PhotoHelper
  def page_photo_for record
    image_tag record.display_photo,
      title: record.photo_title,
      alt: record.photo_title,
      class: 'border-radius'
  end
end
