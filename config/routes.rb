require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :proponents do
    collection do
      get 'calculate_discount_inss_tax_salary'
    end
  end
  resources :discount_rates
  root "homepage#index"
  mount Sidekiq::Web => '/sidekiq'

  get 'login', to: 'authentication#new'  # Página de login
  post 'login', to: 'authentication#login'  # Ação de login
  delete 'logout', to: 'authentication#logout'  # Ação de logout
end
