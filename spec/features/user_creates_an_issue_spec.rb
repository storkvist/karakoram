require 'rails_helper'

# RSpec.feature 'User creates an issue', type: :feature do
RSpec.feature 'Пользователь создаёт задачу', type: :feature do
  scenario 'he sees added issue on the page' do
    visit new_issue_path

    fill_in 'Description', with: 'Description of issue'
    click_button 'Создать задачу'

    expect(page).to have_text('Задача добавлена')
  end
  pending "add some scenarios (or delete) #{__FILE__}"
end
