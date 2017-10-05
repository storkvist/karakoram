class IssueDecorator < Draper::Decorator
  delegate_all

  def status_name
    statuses = {
      accepted: { color: 'danger', name: 'Новая' },
      reviewed: { color: 'warning', name: 'Принята' },
      in_work: { color: 'warning', name: 'В работе' },
      closed: { color: nil, name: 'Выполнена' }
    }

    status = object.status.to_sym
    h.content_tag(:span, statuses[status][:name],
                  class: "tag is-#{statuses[status][:color]}")
  end
end
