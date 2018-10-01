module NavBarHelper
  def active_link?(page_controller)
    controller_name == page_controller ? 'active' : 'inactive'
  end
end
