Rails.application.routes.draw do
  resources :kibanas
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'welcome#new'
  resource :dashboard, only: [:show]

  namespace :api do
    namespace :v1 do
      resource :stores
    end
  end
end
