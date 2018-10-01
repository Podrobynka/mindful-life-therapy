module SettingsHelper
  def footer_office_address settings
    address_details = [
      settings[:office_address_line_1],
      settings[:office_address_line_2],
      settings[:office_address_line_3],
      settings[:office_address_city],
      settings[:office_address_postcode]
    ].reject(&:blank?).join(', ')
  end
end
