Rails.application.routes.draw do
  devise_for :users

  resources :issues, except: %i[destroy], shallow: true do
    collection do
      get 'find'
      get 'stats'
    end

    resources :comments
  end

  root to: 'static#home'
end
