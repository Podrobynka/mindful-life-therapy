module SettingsHelper
  def office_address settings
    content_tag :ul, class: 'no-bullet lmb' do
      company_name_as_list_item
      address_details_as_list(settings)
    end
  end

  def footer_office_address settings
    address_details(settings).join(', ')
  end

  def company_name_as_list_item
    concat content_tag(:li, 'Mindful Life Therapy')
  end

  def address_details_as_list settings
    address_details(settings).each do |detail|
      concat content_tag :li, detail
    end
  end

  def address_details settings
    [
      settings[:office_address_line_1],
      settings[:office_address_line_2],
      settings[:office_address_line_3],
      settings[:office_address_city],
      settings[:office_address_postcode]
    ].reject(&:blank?)
  end
end
