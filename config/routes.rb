Rails.application.routes.draw do
  devise_for :users

  resources :issues, except: %i[destroy], shallow: true do
    collection do
      get 'find'
      get 'stats'
    end

    member do
      get 'history'
    end

    resources :comments
  end

  telegram_webhooks TelegramWebhooksController

  root to: 'static#home'
end
