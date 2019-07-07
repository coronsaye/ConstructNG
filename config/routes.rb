Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: redirect('/api-docs')

  namespace :api do
    namespace :v1 do
      resources :roles, :defaults => { :format => 'json' }
      resources :permissions, :defaults => { :format => 'json' }
      resources :role_permissions, :defaults => { :format => 'json' }
      resources :manufacturers, :defaults => { :format => 'json' }
      resources :occupations, :defaults => { :format => 'json' }
      resources :products, :defaults => { :format => 'json' }
      resources :sectors, :defaults => { :format => 'json' }
      resources :states, :defaults => { :format => 'json' }
      resources :suppliers, :defaults => { :format => 'json' }
      resources :tax_classes, :defaults => { :format => 'json' }
      resources :tax_rates, :defaults => { :format => 'json' }
      resources :product_images, :defaults => { :format => 'json' }
      resources :users, :defaults => { :format => 'json' }
      resources :users, only: :create do
        collection do
          post 'confirm'
          post 'login'
        end
      end

      resources :accounts, only: :create do
        collection do
          post 'register'
          post 'signin'
        end
      end
    end
  end
end
