module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_alerts
    massages = ''
    flash.each { |key, value| massages << content_tag(:p, value, class: "flash #{key}") }
    massages.html_safe
  end
end
