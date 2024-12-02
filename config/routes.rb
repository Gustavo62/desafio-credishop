require 'sidekiq/web'

Rails.application.routes.draw do
  resources :proponents do
    collection do
      get 'calculate_discount_inss_tax_salary'
    end
  end
  resources :discount_rates
  root "homepage#index"
  mount Sidekiq::Web => '/sidekiq'
end
