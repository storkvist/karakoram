class IssuesDecorator < Draper::CollectionDecorator
  def total_count
    h.capture do
      count_txt = count = object.count(&:accepted?)
      reviewed = object.count(&:reviewed?)
      count_txt += ' + ' + reviewed if reviewed.positive?

      txt = I18n.t('activerecord.models.issue', count: count + reviewed)
      h.concat h.content_tag(:strong, count_txt)
      h.concat ' '
      h.concat txt
    end
  end
end
