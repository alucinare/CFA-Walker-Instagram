module ApplicationHelper

  # To highlight the links in the nav bar when its on that page.
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
