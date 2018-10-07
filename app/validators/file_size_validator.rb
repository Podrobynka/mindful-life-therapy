class FileSizeValidator < ActiveModel::EachValidator

  def validate_each record, attribute, value
    return unless value.blob.present? && value.attached?
    purge_file(record, attribute, value) if value.blob.byte_size > allowed_file_size
  end

  private

  def allowed_file_size
    options.fetch(:with)
  end

  def purge_file record, attribute, value
    value.detach
    # value.purge
    # record.new_record? ? value.purge : record.reload.send(value).purge
    record.errors.add attribute, :file_size
  end
end
