Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'welcome#new'

  namespace :api do
    namespace :v1 do
      resource :stores
    end
  end
end
