module FormHelper
  def button_css color: 'success'
    "button strong #{color} dark-border-bottom nmb button-border-bottom button-text-shadow"
  end

  def form_button_css color: 'success'
    "#{button_css color: color} large"
  end

  def form_title_for record
    content_tag :h1, class: 'text-center lmb' do
      t "forms.#{record.class.name.underscore}.title"
    end
  end

  def error_message target: 'errors.message'
    content_tag :div, nil, class: 'error-message hide', data: { target: target }
  end

  def error_count_for target
    pluralize target.errors.count, 'error'
  end
end
