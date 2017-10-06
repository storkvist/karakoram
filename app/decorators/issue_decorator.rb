class IssueDecorator < Draper::Decorator
  delegate_all

  def status_data
    {
      accepted: { color: 'danger',
                  name: 'Новая',
                  description: 'задача зарегистрирована, но с ней пока ничего не делали' },
      reviewed: { color: 'warning',
                  name: 'Принята',
                  description: 'задача зарегистрирована, её посмотрели и рассматривают' },
      in_work: { color: 'warning',
                 name: 'В работе',
                 description: 'по задаче выполняет работа' },
      closed: { color: nil,
                name: 'Выполнена',
                description: 'задача выполнена' }
    }
  end

  def status_name
    status = object.status.to_sym
    h.content_tag(:span, status_data[status][:name],
                  class: "tag is-#{status_data[status][:color]}")
  end

  def full_status_name
    status = object.status.to_sym
    h.capture do
      h.concat h.content_tag(:span, status_data[status][:name],
                             class: "tag is-medium is-#{status_data[status][:color]}")
      h.concat ' '
      h.concat status_data[status][:description]
      h.concat '; последнее изменение '
      h.concat h.l(object.updated_at)
    end
  end
end
