module FormHelper
  def error_message target: 'errors.message'
    content_tag :div, nil, class: 'error-message hide', data: { target: target }
  end

  def error_count_for target
    pluralize target.errors.count, 'error'
  end
end
