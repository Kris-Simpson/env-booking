module ApplicationHelper
  def active_link(page)
    'active' if controller_name == page
  end
end
