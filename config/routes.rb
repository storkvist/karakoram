Rails.application.routes.draw do
  devise_for :users

  resources :issues, only: %i[index new create show], shallow: true do
    collection do
      get 'find'
      get 'stats'
    end

    resources :comments
  end

  root to: 'static#home'
end
