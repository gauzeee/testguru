module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_alerts
    massages = ''
    flash.each { |key, value| massages << content_tag(:p, value, class: "flash #{bootstrap_class_for(key)}") }
    massages.html_safe
  end


end
