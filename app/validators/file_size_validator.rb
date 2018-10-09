class FileSizeValidator < ActiveModel::EachValidator

  def validate_each record, attribute, value
    return unless value.attached? && value.blob.present?
    purge_file(record, attribute, value) if value.byte_size > allowed_photo_size
  end

  private

  def allowed_photo_size
    options.fetch(:with)
  end

  def purge_file record, attribute, value
    value.purge
    record.errors.add attribute, :file_size
  end
end
