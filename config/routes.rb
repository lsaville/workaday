Rails.application.routes.draw do
  root 'home#index'
  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/google_oauth2', as: :google_login
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'

  resources :projects, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      namespace :projects do
        get '',        to: 'projects#index'
        post '',       to: 'projects#create'
        get '/:id',    to: 'projects#show'
        put '/:id',    to: 'projects#update'
        patch '/:id',  to: 'projects#update'
        delete '/:id', to: 'projects#destroy'
      end
    end
  end
end
