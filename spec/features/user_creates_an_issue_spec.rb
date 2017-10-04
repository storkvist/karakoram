require 'rails_helper'

# RSpec.feature 'User creates an issue', type: :feature do
RSpec.feature 'Пользователь создаёт задачу', type: :feature do
  scenario 'видит описание созданную задачу' do
    visit new_issue_path

    fill_in I18n.t('activerecord.attributes.issue.description'),
            with: 'Description of issue'
    click_button I18n.t('helpers.submit.issue.create')

    expect(page)
      .to have_text(I18n.t('helpers.submit.issue.created_notification'))
    expect(page).to have_text('Description of issue')
  end
end
