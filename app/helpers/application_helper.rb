module ApplicationHelper

  # To highlight the links in the nav bar when its on that page.
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
  
end
