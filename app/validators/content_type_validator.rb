class ContentTypeValidator < ActiveModel::EachValidator

  def validate_each record, attribute, value
    return unless value.blob.present? && value.attached?
    purge_file(record, attribute, value) if allowed_content_types.exclude?(value.blob.content_type)
  end

  private

  def allowed_content_types
    options.fetch(:in)
  end

  def purge_file record, attribute, value
    # value.detach
    value.purge
    record.errors.add attribute, :content_type
  end
end
