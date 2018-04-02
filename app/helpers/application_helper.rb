module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_text(action)
    content_tag(:p, flash[action], class: "flash #{action}") if flash[action]
  end
end
