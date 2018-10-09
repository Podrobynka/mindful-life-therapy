class ContentTypeValidator < ActiveModel::EachValidator

  def validate_each record, attribute, value
    return unless value.attached? && value.blob.present?
    purge_file(record, attribute, value) if allowed_photo_content_types.exclude?(value.content_type)
  end

  private

  def allowed_photo_content_types
    options.fetch(:in)
  end

  def purge_file record, attribute, value
    value.purge
    record.errors.add attribute, :content_type
  end
end
