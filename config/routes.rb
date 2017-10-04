Rails.application.routes.draw do
  devise_for :users

  resources :issues, only: %i[index new create]

  root to: 'issues#index'
end
