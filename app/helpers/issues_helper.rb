module IssuesHelper
  def switch_status_of_issues(current_status)
    names = [
      { name: 'Новые', params: { status: %w[accepted reviewed] } },
      { name: 'В работе', params: { status: 'in_work' } },
      { name: 'Закрытые', params: { status: 'closed' } },
      { name: 'Все', params: nil }
    ]

    content_tag(:div, class: 'level-right') do
      names.map { |o| switch_option(o, current_status) }.join.html_safe
    end
  end

  private

  def switch_option(option, current_status)
    content_tag(:p, class: 'level-item') do
      if current_status == option.try(:[], :params).try(:[], :status)
        content_tag(:strong, option[:name])
      else
        link_to option[:name], issues_path(option[:params])
      end
    end
  end
end
