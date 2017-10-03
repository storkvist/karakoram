Rails.application.routes.draw do
  resources :issues, only: %i[index]

  root to: 'issues#index'
end
