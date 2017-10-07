class IssuesDecorator < Draper::CollectionDecorator
  def total_count
    count_txt = count = object.count(&:accepted?)
    reviewed = object.count(&:reviewed?)
    count_txt += ' + ' + reviewed if reviewed.positive?

    txt = I18n.t('activerecord.models.issue', count: count + reviewed)
    "#{h.content_tag(:strong, count_txt)} #{txt}".html_safe
  end
end
