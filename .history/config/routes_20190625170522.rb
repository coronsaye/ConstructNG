Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: redirect('/api-docs')

  namespace :api do
    namespace :v1 do
      resources :roles, :defaults => { :format => 'json' }
      resources :permissions
      resources :role_permissions
      resources :manufacturers
      resources :occupations
      resources :products
      resources :sectors
      resources :states
      resources :suppliers
      resources :tax_classes
      resources :tax_rates
      resources :product_images
      resources :users
    end
  end
end
