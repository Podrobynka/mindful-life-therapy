module ApplicationHelper
  def css_class_for_controller(kontroller_name)
    if request.path.match(kontroller_name) || (controller_name == kontroller_name)
      'active'
    end
  end

  def css_class_for_path(path)
    if request.path.match(path)
      'active'
    end
  end

  def css_class_for_controller_and_action(kontroller_name, aktion_name)
    css_class_for_controller(kontroller_name) if aktion_name == action_name
  end
end
