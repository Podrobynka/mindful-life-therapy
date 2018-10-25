module MapHelper
  def office_map settings, css_class=nil
    content_tag :div, nil, id: 'map', class: css_class, data: { latitude: settings.latitude, longitude: settings.longitude }
  end
end
