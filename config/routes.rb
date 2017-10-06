Rails.application.routes.draw do
  devise_for :users

  resources :issues, only: %i[index new create show] do
    collection do
      get 'find'
    end
  end

  root to: 'static#home'
end
