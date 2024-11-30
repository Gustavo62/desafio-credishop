Rails.application.routes.draw do
  resources :discount_rates
  root "homepage#index"
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
