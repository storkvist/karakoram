Rails.application.routes.draw do
  devise_for :users

  resources :issues, only: %i[index new create show]

  root to: 'static#home'
end
