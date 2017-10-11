require 'rails_helper'

# RSpec.feature 'User creates an issue', type: :feature do
RSpec.feature 'Пользователь создаёт задачу', type: :feature do
  scenario 'видит описание созданную задачу' do
    issue = build(:issue)

    visit new_issue_path

    select issue.building,
           from: I18n.t('activerecord.attributes.issue.building')
    fill_in I18n.t('activerecord.attributes.issue.room'),
            with: issue.room
    fill_in I18n.t('activerecord.attributes.issue.description'),
            with: issue.description
    click_button I18n.t('helpers.submit.issue.create')

    expect(page)
      .to have_text(I18n.t('helpers.submit.issue.created_notification'))
    expect(page).to have_text(issue.description)
  end
end
