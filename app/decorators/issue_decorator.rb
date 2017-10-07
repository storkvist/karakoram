class IssueDecorator < Draper::Decorator
  delegate_all

  # rubocop:disable Metrics/MethodLength
  def status_data
    {
      accepted: { color: 'danger',
                  name: 'Новая',
                  description: 'задача зарегистрирована, но с ней пока ничего '\
                               'не делали' },
      reviewed: { color: 'warning',
                  name: 'Принята',
                  description: 'задача зарегистрирована, её посмотрели '\
                               'и рассматривают' },
      in_work: { color: 'warning',
                 name: 'В работе',
                 description: 'по задаче выполняет работа' },
      closed: { color: nil,
                name: 'Выполнена',
                description: 'задача выполнена' }
    }
  end
  # rubocop:enable Metrics/MethodLength

  def status_tag(name, color, size = '')
    h.content_tag(:span, name, class: "tag is-#{size} is-#{color}")
  end

  def status_name(size = '')
    status = object.status.to_sym
    status_tag(status_data[status][:name], status_data[status][:color], size)
  end

  def full_status_name
    status = object.status.to_sym
    [
      status_name(:medium),
      ' ',
      status_data[status][:description],
      '; последнее изменение ',
      h.l(object.updated_at)
    ].join.html_safe
  end
end
